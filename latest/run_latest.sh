#!/usr/bin/env bash
# Orchestrate the fair "latest-branch" benchmark across isolated Lake projects.
#
# Each tactic is benchmarked in its OWN Lake project pinned to its latest default
# branch and whatever Lean toolchain that branch currently declares (tracked live,
# not pinned). Results + a version manifest land under latest/results/.
#
# Results are cached per tool keyed on (resolved commit + toolchain + benchmark
# source hash + CACHE_VERSION): if a tool's branch HEAD has not moved since its last
# successful run, its cached CSVs are reused and the expensive build+run is skipped.
# Set NO_CACHE=1 to force a full re-run. Cache lives in latest/results_cache/ (in CI,
# back that dir with actions/cache).
#
# Requires bash 5 (associative-array-free, but nameref/${var^^} used); re-exec if old.
if [[ "${BASH_VERSINFO:-0}" -lt 4 ]]; then
    exec /opt/homebrew/bin/bash "$0" "$@"
fi
set -uo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$HERE/.." && pwd)"
BENCH="$REPO_ROOT/benchmarks/benchmark.sh"
BASH5="$(command -v /opt/homebrew/bin/bash || command -v bash)"
RESULTS="${BENCH_RESULTS:-$HERE/results}"
MANIFEST="$RESULTS/manifest.tsv"
TIMEOUT="${TIMEOUT:-20}"

# --- result caching ---
# Bump CACHE_VERSION whenever the harness's test generation changes in a way that
# would alter results, to invalidate every cached entry.
CACHE_VERSION="4"   # v2: env_errors; v3: cvc5 dylib; v4: per-suite cache granularity
CACHE_DIR="${RESULTS_CACHE:-$HERE/results_cache}"
NO_CACHE="${NO_CACHE:-0}"

mkdir -p "$RESULTS" "$CACHE_DIR"

# Portable content hash of stdin -> hex digest.
hash_stdin() {
    if command -v shasum &>/dev/null; then shasum -a 1 | awk '{print $1}'
    elif command -v sha1sum &>/dev/null; then sha1sum | awk '{print $1}'
    else cksum | tr -d ' \t'; fi
}

# Benchmark suite definitions live in benchmark_config.sh (BENCHMARK_FILES); source
# it so we can cache results PER SUITE (adding/editing one suite then only re-runs
# that suite, not the whole set).
source "$REPO_ROOT/benchmarks/benchmark_config.sh" 2>/dev/null || true

# Content hash of a single suite (its .lean file, or every .lean under a taskdir).
# Args: file_path mode   (mode = stmt | taskdir)
suite_hash() {
    local fp="$REPO_ROOT/$1" mode="$2"
    if [[ "$mode" == "taskdir" ]]; then
        { find "$fp" -name '*.lean' -type f | sort
          find "$fp" -name '*.lean' -type f | sort | xargs cat; } 2>/dev/null | hash_stdin
    else
        hash_stdin < "$fp" 2>/dev/null
    fi
}

# Resolve a branch's HEAD commit without cloning. Echoes short sha, or "" on failure.
resolve_commit() {
    local url="$1" branch="$2" line
    line="$(git ls-remote "$url" "refs/heads/$branch" 2>/dev/null | head -1)"
    echo "${line:0:9}"
}

# Per-suite cache key: tool identity (dir+commit+toolchain+tactics) + that suite's
# own content hash. Adding/editing one suite changes only its key.
cache_key() {  # dir commit toolchain tactics suite_hash
    printf '%s|%s|%s|%s|%s|%s' "$1" "$2" "$3" "$4" "$5" "$CACHE_VERSION" | hash_stdin
}

# Newest STABLE (non-rc) mathlib release tag, e.g. v4.31.0. Drives the baselines
# project so the built-in tactics track the latest Lean 4 release automatically.
latest_stable_mathlib_tag() {
    git ls-remote --tags https://github.com/leanprover-community/mathlib4 2>/dev/null \
      | grep -oE 'v4\.[0-9]+\.[0-9]+$' | sort -V | tail -1
}

# tool table: dir | require-name | git-url | branch | tactics(;) | build-module | import-overrides(;)
#   dir             filesystem dir + results subdir (lowercase)
#   require-name    Lean package name in the lakefile AND lake-manifest (case matters:
#                   LeanHammer's package is "Hammer"; Lean-blaster's main renamed
#                   its package Solver -> Blaster). Empty => repo-less project.
#   git-url/branch  empty => repo-less "baselines" project: requires only mathlib at
#                   the latest stable tag (toolchain tracked live from that tag).
#   tactics         ';'-separated list run in this one project (the harness supports
#                   multiple tactics per project; blaster runs two variants here).
#   build-module    module the benchmark imports, built so `lake env lean` finds it;
#                   empty => nothing to build (built-in tactics need only mathlib).
#   import-overrides ';'-separated, aligned with tactics; entry may be empty. Needed
#                   when a branch renamed its module namespace (blaster: Solver.* -> Blaster.*).
# (repo-backed toolchains are fetched live from the branch -> "track moving branch")
TOOLS=(
    "blaster|Blaster|https://github.com/input-output-hk/Lean-blaster|main|blaster;blaster (only-optimize: 1)|Blaster.Command.Tactic|Blaster.Command.Tactic;Blaster.Command.Tactic"
    "smt|smt|https://github.com/ufmg-smite/lean-smt.git|main|smt +model|Smt|Smt"
    "hammer|Hammer|https://github.com/JOSHCLUNE/LeanHammer.git|main|hammer|Hammer|"
    "auto|auto|https://github.com/leanprover-community/lean-auto.git|main|auto|Auto.Tactic|"
    "aesop|aesop|||aesop|Aesop|"
    "baselines||||omega;grind;simp||"
)

# Package name must be a valid Lean identifier
pkg_name() { echo "${1^}Latest"; }

# Build the raw.githubusercontent URL for a repo's lean-toolchain on a branch
raw_toolchain_url() {
    local url="$1" branch="$2"
    url="${url%.git}"
    url="${url/github.com/raw.githubusercontent.com}"
    echo "$url/$branch/lean-toolchain"
}

scaffold() {
    local dir="$1" reqname="$2" url="$3" branch="$4" tactics_str="$5" imports_str="$6"
    local proj="$HERE/projects/$dir"
    mkdir -p "$proj"

    # 1. toolchain + mathlib requirement
    local tc mathlib_req
    if [[ -n "$url" ]]; then
        # repo-backed: toolchain fetched live from the tool's branch; mathlib matches it
        tc="$(curl -fsSL "$(raw_toolchain_url "$url" "$branch")" 2>/dev/null | tr -d '[:space:]')"
        mathlib_req='def leanVersion : String := s!"v{Lean.versionString}"'$'\n''require "leanprover-community" / mathlib @ git leanVersion'
    else
        # repo-less baselines: latest stable mathlib tag drives the toolchain
        local tag; tag="$(latest_stable_mathlib_tag)"
        [[ -z "$tag" ]] && { echo "  ! could not resolve latest mathlib tag" >&2; return 1; }
        tc="$(curl -fsSL "https://raw.githubusercontent.com/leanprover-community/mathlib4/$tag/lean-toolchain" 2>/dev/null | tr -d '[:space:]')"
        mathlib_req="require \"leanprover-community\" / mathlib @ git \"$tag\""
    fi
    [[ -z "$tc" ]] && { echo "  ! could not fetch toolchain for $dir" >&2; return 1; }
    printf '%s\n' "$tc" > "$proj/lean-toolchain"

    # 2. lakefile: the tool (if any) + mathlib (STG4 imports Mathlib)
    {
        echo "import Lake"
        echo "open Lake DSL"
        echo ""
        echo "package $(pkg_name "$dir") where"
        echo ""
        [[ -n "$url" ]] && echo "require ${reqname} from git \"${url}\" @ \"${branch}\"" && echo ""
        echo "$mathlib_req"
    } > "$proj/lakefile.lean"

    # 3. shared benchmark sources
    ln -sfn ../../../BlasterBenchmarks "$proj/BlasterBenchmarks"

    # 4. per-project config: the tactic list + aligned import overrides
    local oldifs="$IFS"; IFS=';'; local -a tacs=($tactics_str) imps=($imports_str); IFS="$oldifs"
    {
        echo '#!/usr/bin/env bash'
        echo '# Generated by run_latest.sh'
        printf 'TACTICS=('
        local t; for t in "${tacs[@]}"; do printf '"%s" ' "$t"; done
        echo ')'
        echo "OUTPUT_DIR=\"${RESULTS}/${dir}\""
        echo 'TEMP_DIR="benchmark_temp"'
        # import overrides (TACTIC_IMPORTS is a -A array declared in benchmark_config.sh)
        local i
        for i in "${!tacs[@]}"; do
            local imp="${imps[$i]:-}"
            [[ -n "$imp" ]] && printf 'TACTIC_IMPORTS["%s"]="%s"\n' "${tacs[$i]}" "$imp"
        done
    } > "$proj/config.sh"
    return 0
}

# manifest header (create once; per-tool rows are replaced in place so a single
# tool can be re-run without discarding the others)
[[ -f "$MANIFEST" ]] || printf 'tool\ttoolchain\tbranch\tresolved_commit\ttactic\tbuild_status\n' > "$MANIFEST"

# Append a manifest row (tool toolchain branch commit tactic status), replacing any
# existing row for the same TACTIC first (a project may contribute several tactics).
# Uses awk (portable) rather than `grep -P`, which BSD/macOS grep lacks.
manifest_put() {
    local tac="$5" tmp="$MANIFEST.tmp"
    awk -F'\t' -v t="$tac" 'NR==1 || $5!=t' "$MANIFEST" > "$tmp" && mv "$tmp" "$MANIFEST"
    printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$@" >> "$MANIFEST"
}

# Write one manifest row per tactic in the current project (uses run_tool's locals
# via bash dynamic scope: dir, tc, branch_label, commit_label, tactics_str).
put_rows() {  # status
    local status="$1" t oldifs="$IFS"
    IFS=';'; local -a tacs=($tactics_str); IFS="$oldifs"
    for t in "${tacs[@]}"; do
        manifest_put "$dir" "$tc" "$branch_label" "$commit_label" "$t" "$status"
    done
}

run_tool() {
    local row="$1"
    IFS='|' read -r dir reqname url branch tactics_str module imports_str <<< "$row"
    local proj="$HERE/projects/$dir"
    echo "==================== $dir (${branch:-latest stable}) ===================="

    # --- identity resolution (no clone / no build) ---
    # repo-backed: branch HEAD commit + branch toolchain.
    # repo-less: latest stable mathlib tag is the identity/toolchain. reqname empty ->
    # built-in tactics "(core)"; reqname set -> mathlib-bundled package (aesop) "(via mathlib)".
    local commit tc branch_label commit_label
    if [[ -n "$url" ]]; then
        commit="$(resolve_commit "$url" "$branch")"
        tc="$(curl -fsSL "$(raw_toolchain_url "$url" "$branch")" 2>/dev/null | tr -d '[:space:]')"
        branch_label="$branch"; commit_label="$commit"
    else
        commit="$(latest_stable_mathlib_tag)"
        [[ -n "$commit" ]] && tc="$(curl -fsSL "https://raw.githubusercontent.com/leanprover-community/mathlib4/$commit/lean-toolchain" 2>/dev/null | tr -d '[:space:]')"
        branch_label="stable"
        [[ -n "$reqname" ]] && commit_label="(via mathlib)" || commit_label="(core)"
    fi

    # --- classify each suite: cached (per-suite key hit) vs missing ---
    local can_cache=0
    [[ "$NO_CACHE" != "1" && -n "$commit" && -n "$tc" && "$commit" != "?" ]] && can_cache=1
    local sdir="$CACHE_DIR/$dir"
    local cached_disp=() cached_sc=() missing_specs=()
    local spec imp fp disp to mode sh sk sc
    for spec in "${BENCHMARK_FILES[@]}"; do
        IFS=':' read -r imp fp disp to mode <<< "$spec"; mode="${mode:-stmt}"
        sh="$(suite_hash "$fp" "$mode")"
        sc="$sdir/$disp/$(cache_key "$dir" "$commit" "$tc" "$tactics_str" "$sh")"
        if [[ $can_cache -eq 1 && -f "$sc/${disp}_results.csv" ]]; then
            cached_disp+=("$disp"); cached_sc+=("$sc")
        else
            missing_specs+=("$spec")
        fi
    done

    # fresh results/<tool>/ dir (missing suites will be run into it; cached copied in)
    mkdir -p "$RESULTS/$dir"
    rm -f "$RESULTS/$dir"/*_results.csv "$RESULTS/$dir/env_errors.tsv"
    : > "$RESULTS/$dir/env_errors.tsv"

    # --- run only the missing suites (build the tool first) ---
    if [[ ${#missing_specs[@]} -gt 0 ]]; then
        [[ "$NO_CACHE" == "1" ]] && echo "  NO_CACHE=1 - running all ${#missing_specs[@]} suites" \
          || echo "  ${#missing_specs[@]} suite(s) to run, ${#cached_disp[@]} cached (${commit:-?} @ ${tc:-?})"
        scaffold "$dir" "$reqname" "$url" "$branch" "$tactics_str" "$imports_str" || { put_rows "SCAFFOLD_FAIL"; return; }
        [[ -z "$tc" ]] && tc="$(tr -d '[:space:]' < "$proj/lean-toolchain")"
        # restrict this benchmark run to the missing suites
        { printf 'BENCHMARK_FILES=('; for spec in "${missing_specs[@]}"; do printf '"%s" ' "$spec"; done; echo ')'; } >> "$proj/config.sh"
        echo "  toolchain: $tc"
        ( cd "$proj"
          echo "  lake update..."; lake update > update.log 2>&1
          echo "  cache get...";   lake exe cache get > cache.log 2>&1 || true
          if [[ -n "$module" ]]; then echo "  build ${module}..."; lake build "${module}" > build.log 2>&1; else echo "  (no tool build)"; fi )
        local build_rc=$?
        if [[ -n "$url" && ( -z "$commit" || "$commit" == "?" ) ]]; then
            commit="$(python3 -c "import json
try:
 d=json.load(open('$proj/lake-manifest.json')); print(next((p['rev'][:9] for p in d['packages'] if p.get('name')=='$reqname'),'?'))
except Exception: print('?')" 2>/dev/null)"; commit="${commit:-?}"; commit_label="$commit"
        fi
        if [[ $build_rc -ne 0 ]]; then echo "  BUILD FAILED (see $proj/build.log)"; put_rows "BUILD_FAIL"; return; fi
        local extra="" lib
        for lib in "$proj"/.lake/packages/cvc5/.lake/build/lib/libcvc5_cvc5.{dylib,so}; do [[ -f "$lib" ]] && extra="$extra --load-dynlib=$lib"; done
        echo "  running ${#missing_specs[@]} suite(s)...${extra:+ (cvc5 FFI)}"
        ( cd "$proj" && LEAN_EXTRA_ARGS="$extra" QUIET=1 "$BASH5" "$BENCH" run -c ./config.sh -t "$TIMEOUT" > bench.log 2>&1 )
        # save each freshly-run suite to its own cache entry (identity must be stable)
        if [[ -n "$commit" && "$commit" != "?" && -n "$tc" ]]; then
            for spec in "${missing_specs[@]}"; do
                IFS=':' read -r imp fp disp to mode <<< "$spec"; mode="${mode:-stmt}"
                [[ -f "$RESULTS/$dir/${disp}_results.csv" ]] || continue
                sc="$sdir/$disp/$(cache_key "$dir" "$commit" "$tc" "$tactics_str" "$(suite_hash "$fp" "$mode")")"
                mkdir -p "$sc"
                cp "$RESULTS/$dir/${disp}_results.csv" "$sc/"
                awk -F'\t' -v d="$disp" '$1==d' "$RESULTS/$dir/env_errors.tsv" 2>/dev/null > "$sc/env.tsv"
            done
        fi
    else
        echo "  all ${#cached_disp[@]} suites cached ($commit @ $tc) - skipping build"
    fi

    # --- assemble: copy cached suites in (missing ones are already present from the run) ---
    local i
    for ((i=0; i<${#cached_disp[@]}; i++)); do
        cp "${cached_sc[$i]}/${cached_disp[$i]}_results.csv" "$RESULTS/$dir/" 2>/dev/null
        [[ -f "${cached_sc[$i]}/env.tsv" ]] && cat "${cached_sc[$i]}/env.tsv" >> "$RESULTS/$dir/env_errors.tsv"
    done

    if [[ ${#missing_specs[@]} -eq 0 ]]; then put_rows "CACHED"; else put_rows "OK"; fi
    echo "  done: results in $RESULTS/$dir (${#cached_disp[@]} cached, ${#missing_specs[@]} run)"
}

# --- arg handling: which tools to run (default: all) ---
WANT=()
for a in "$@"; do
    case "$a" in
        all) for r in "${TOOLS[@]}"; do WANT+=("$r"); done ;;
        *) for r in "${TOOLS[@]}"; do [[ "$r" == "$a|"* ]] && WANT+=("$r"); done ;;
    esac
done
[[ ${#WANT[@]} -eq 0 ]] && { for r in "${TOOLS[@]}"; do WANT+=("$r"); done; }

for row in "${WANT[@]}"; do run_tool "$row"; done

echo; echo "===== MANIFEST ====="; column -t -s$'\t' "$MANIFEST"
