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
CACHE_VERSION="1"
CACHE_DIR="${RESULTS_CACHE:-$HERE/results_cache}"
NO_CACHE="${NO_CACHE:-0}"

mkdir -p "$RESULTS" "$CACHE_DIR"

# Portable content hash of stdin -> hex digest.
hash_stdin() {
    if command -v shasum &>/dev/null; then shasum -a 1 | awk '{print $1}'
    elif command -v sha1sum &>/dev/null; then sha1sum | awk '{print $1}'
    else cksum | tr -d ' \t'; fi
}

# Hash of the benchmark theorem sources (names + contents): changing any theorem
# invalidates every tool's cache.
BENCH_HASH="$({ find "$REPO_ROOT/BlasterBenchmarks" -name '*.lean' -type f | sort
                find "$REPO_ROOT/BlasterBenchmarks" -name '*.lean' -type f | sort | xargs cat
              } 2>/dev/null | hash_stdin)"

# Resolve a branch's HEAD commit without cloning. Echoes short sha, or "" on failure.
resolve_commit() {
    local url="$1" branch="$2" line
    line="$(git ls-remote "$url" "refs/heads/$branch" 2>/dev/null | head -1)"
    echo "${line:0:9}"
}

# Cache key for a tool's results.
cache_key() {  # tool commit toolchain tactic
    printf '%s|%s|%s|%s|%s|%s' "$1" "$2" "$3" "$4" "$BENCH_HASH" "$CACHE_VERSION" | hash_stdin
}

# tool table: dir | require-name | git-url | branch | tactic | build-module | import-override
#   dir             filesystem dir + results subdir (lowercase)
#   require-name    Lean package name in the lakefile AND lake-manifest (case matters:
#                   LeanHammer's package is "Hammer"; Lean-blaster's main renamed
#                   its package Solver -> Blaster)
#   build-module    the exact module the benchmark imports, so we build precisely
#                   what `lake env lean` will need
#   import-override (optional) tactic import to use instead of benchmark_config.sh's
#                   default — needed when the latest branch renamed its module
#                   namespace (blaster: Solver.Command.Tactic -> Blaster.Command.Tactic)
# (toolchain is fetched live from the branch, implementing "track moving branch")
TOOLS=(
    "blaster|Blaster|https://github.com/input-output-hk/Lean-blaster|main|blaster|Blaster.Command.Tactic|Blaster.Command.Tactic"
    "smt|smt|https://github.com/ufmg-smite/lean-smt.git|main|smt +model|Smt"
    "hammer|Hammer|https://github.com/JOSHCLUNE/LeanHammer.git|main|hammer|Hammer"
    "auto|auto|https://github.com/leanprover-community/lean-auto.git|main|auto|Auto.Tactic"
    "aesop|aesop|https://github.com/leanprover-community/aesop|master|aesop|Aesop"
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
    local dir="$1" reqname="$2" url="$3" branch="$4" tactic="$5" import_override="${6:-}"
    local proj="$HERE/projects/$dir"
    mkdir -p "$proj"

    # 1. toolchain: fetch live from the tool's branch
    local tc
    tc="$(curl -fsSL "$(raw_toolchain_url "$url" "$branch")" 2>/dev/null | tr -d '[:space:]')"
    if [[ -z "$tc" ]]; then
        echo "  ! could not fetch toolchain for $dir from $branch" >&2
        return 1
    fi
    printf '%s\n' "$tc" > "$proj/lean-toolchain"

    # 2. lakefile: require the tool@branch + mathlib matching this toolchain
    cat > "$proj/lakefile.lean" <<EOF
import Lake
open Lake DSL

package $(pkg_name "$dir") where

-- Tactic under test: latest default branch (tracked live)
require ${reqname} from git "${url}" @ "${branch}"

-- Mathlib pinned to the tag matching this project's toolchain (STG4 imports Mathlib)
def leanVersion : String := s!"v{Lean.versionString}"
require "leanprover-community" / mathlib @ git leanVersion
EOF

    # 3. shared benchmark sources
    ln -sfn ../../../BlasterBenchmarks "$proj/BlasterBenchmarks"

    # 4. per-tool benchmark config (single tactic, central results dir)
    cat > "$proj/config.sh" <<EOF
#!/usr/bin/env bash
# Generated by run_latest.sh - per-tool benchmark override.
TACTICS=("${tactic}")
OUTPUT_DIR="${RESULTS}/${dir}"
TEMP_DIR="benchmark_temp"
EOF
    # Override the tactic's import when the latest branch renamed its module
    # namespace (TACTIC_IMPORTS is a -A array declared in benchmark_config.sh).
    if [[ -n "$import_override" ]]; then
        printf 'TACTIC_IMPORTS["%s"]="%s"\n' "$tactic" "$import_override" >> "$proj/config.sh"
    fi
    return 0
}

# manifest header (create once; per-tool rows are replaced in place so a single
# tool can be re-run without discarding the others)
[[ -f "$MANIFEST" ]] || printf 'tool\ttoolchain\tbranch\tresolved_commit\ttactic\tbuild_status\n' > "$MANIFEST"

# Append a manifest row, replacing any existing row for the same tool first.
# Uses awk (portable) rather than `grep -P`, which BSD/macOS grep lacks.
manifest_put() {
    local tool="$1"; shift
    local tmp="$MANIFEST.tmp"
    awk -F'\t' -v t="$tool" 'NR==1 || $1!=t' "$MANIFEST" > "$tmp" && mv "$tmp" "$MANIFEST"
    printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$tool" "$@" >> "$MANIFEST"
}

run_tool() {
    local row="$1"
    IFS='|' read -r dir reqname url branch tactic module import_override <<< "$row"
    local proj="$HERE/projects/$dir"
    echo "==================== $dir ($branch) ===================="

    # --- cheap identity resolution (no clone / no build) for the cache key ---
    local commit tc key="" cdir=""
    commit="$(resolve_commit "$url" "$branch")"
    tc="$(curl -fsSL "$(raw_toolchain_url "$url" "$branch")" 2>/dev/null | tr -d '[:space:]')"
    if [[ -n "$commit" && -n "$tc" ]]; then
        key="$(cache_key "$dir" "$commit" "$tc" "$tactic")"
        cdir="$CACHE_DIR/$dir/$key"
    fi

    # --- cache hit: reuse results, skip the expensive build + run ---
    if [[ "$NO_CACHE" != "1" && -n "$cdir" ]] && compgen -G "$cdir/"'*_results.csv' >/dev/null 2>&1; then
        echo "  cache HIT ($commit @ $tc) - reusing results, skipping build"
        mkdir -p "$RESULTS/$dir"
        cp "$cdir/"*_results.csv "$RESULTS/$dir/"
        manifest_put "$dir" "$tc" "$branch" "$commit" "$tactic" "CACHED"
        echo "  done (cached): results in $RESULTS/$dir"
        return
    fi
    [[ "$NO_CACHE" == "1" ]] && echo "  NO_CACHE=1 - forcing rebuild" \
                             || echo "  cache miss (${commit:-?} @ ${tc:-?}) - building"

    scaffold "$dir" "$reqname" "$url" "$branch" "$tactic" "$import_override" || {
        manifest_put "$dir" "?" "$branch" "?" "$tactic" "SCAFFOLD_FAIL"
        return
    }
    [[ -z "$tc" ]] && tc="$(tr -d '[:space:]' < "$proj/lean-toolchain")"
    echo "  toolchain: $tc"

    ( cd "$proj" || exit 1
      echo "  lake update...";              lake update           > update.log 2>&1
      echo "  cache get...";                lake exe cache get     > cache.log  2>&1 || true
      echo "  build ${module}...";          lake build "${module}" > build.log  2>&1
    )
    local build_rc=$?

    # authoritative resolved commit from the built manifest (falls back to ls-remote)
    if [[ -z "$commit" ]]; then
        commit="$(python3 -c "import json
try:
    d=json.load(open('$proj/lake-manifest.json'))
    print(next((p['rev'][:9] for p in d['packages'] if p.get('name')=='$reqname'),'?'))
except Exception: print('?')" 2>/dev/null)"
        commit="${commit:-?}"
    fi

    if [[ $build_rc -ne 0 ]]; then
        echo "  BUILD FAILED (see $proj/build.log)"
        manifest_put "$dir" "$tc" "$branch" "$commit" "$tactic" "BUILD_FAIL"
        return   # failures are never cached, so they retry next run
    fi

    echo "  running benchmark..."
    ( cd "$proj" && QUIET=1 "$BASH5" "$BENCH" run -c ./config.sh -t "$TIMEOUT" > bench.log 2>&1 )
    manifest_put "$dir" "$tc" "$branch" "$commit" "$tactic" "OK"
    echo "  done: results in $RESULTS/$dir"

    # --- save results to cache under the identity key ---
    if [[ -n "$commit" && "$commit" != "?" && -n "$tc" ]]; then
        [[ -z "$key" ]] && cdir="$CACHE_DIR/$dir/$(cache_key "$dir" "$commit" "$tc" "$tactic")"
        mkdir -p "$cdir"
        cp "$RESULTS/$dir/"*_results.csv "$cdir/" 2>/dev/null && echo "  cached results for reuse"
    fi
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
