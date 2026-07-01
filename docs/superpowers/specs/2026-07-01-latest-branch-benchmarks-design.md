# Fair "latest-branch" tactic benchmark across isolated projects

**Date:** 2026-07-01
**Status:** Approved

## Problem

The benchmark ([lakefile.lean](../../../lakefile.lean)) currently pins every tactic
to a **v4.24.0-compatible** version so the whole project builds against one Lean
toolchain (`leanprover/lean4:v4.24.0`). That is fair only in the sense that
everyone agrees on the Lean version. We instead want each tactic benchmarked on
**its own latest default branch**, even though those branches target different
Lean toolchains.

A single Lake project can use only one Lean toolchain, so "latest for everyone"
cannot live in one project. Resolved default branches (as of 2026-06-29):

| Tool | Branch | Toolchain | mathlib tag exists? |
|------|--------|-----------|---------------------|
| blaster (Solver) | main | v4.24.0 | yes (current) |
| smt | main | v4.29.0 | yes (`v4.29.0`) |
| hammer | main | v4.30.0 | yes (`v4.30.0`) |
| auto | main | v4.31.0 | yes (`v4.31.0`) |
| aesop | master | v4.32.0-rc1 | yes (`v4.32.0-rc1`) |

`blaster`'s latest is already v4.24.0 — identical to the current pin — so the
existing root project **is** the blaster-latest project and is reused as-is.

## Decisions (from brainstorming)

- **Isolation:** one Lake project per tool, each on its own toolchain.
- **Pinning:** track the moving branch (`@main`/`@master`); `lake update` re-resolves
  HEAD at run time. Not reproducible by design — always "latest".
- **Compile breakage:** best-effort. Theorems whose statement fails to elaborate on
  a newer toolchain are marked `ENV` (distinct from tactic `FAIL`/`TIMEOUT`).

## Architecture

```
latest/
  projects/
    smt/      lean-toolchain (v4.29) · lakefile (require smt@main + mathlib@leanVersion)
              · symlink -> ../../../BlasterBenchmarks · config.sh
    hammer/   (v4.30, require Hammer@main -> pulls its own auto/duper)
    auto/     (v4.31, require auto@main)
    aesop/    (v4.32-rc1, require aesop@master)
  results/    per-tool CSVs + manifest.tsv + merged.csv + dashboard.html
  run_latest.sh   orchestrator
```

- Each `latest/projects/<tool>` symlinks the same `BlasterBenchmarks/` sources so
  all tools run identical theorems (NNG4, STG4, ITL4). STG4 imports Mathlib, so
  every project requires mathlib at its own toolchain (`require mathlib @ leanVersion`,
  matching the existing pattern; the tag exists for every toolchain above).
- **Per-tool `config.sh`** overrides `TACTICS=(<that one tactic>)` plus its import /
  preamble and a per-tool `OUTPUT_DIR`. The existing `benchmark.sh` is reused
  verbatim per project via `-c config.sh` — no fork of the runner.
- **blaster** runs in the existing root project (already built), producing the
  blaster column.

### Orchestrator (`latest/run_latest.sh`)

Per tool:
1. `lake update <tool>` — re-resolve moving branch HEAD.
2. Record resolved commit + toolchain into `results/manifest.tsv`.
3. `lake exe cache get` — fetch prebuilt mathlib oleans for the toolchain.
4. `lake build` — build the tool. On failure: mark `BUILD_FAIL`, skip, continue.
5. Run `benchmark.sh run -c config.sh` -> per-tool CSV.

### Env-error bucket

Add a cheap pre-check to `benchmark_core.sh`: compile `example <statement> := by sorry`
once per theorem per project. If the statement itself does not elaborate on that
toolchain, status = `ENV` (not `FAIL`). One extra compile per theorem per project.

### Merged output

Combine per-tool CSVs into one comparison table + dashboard. **Each tactic column is
labeled with its toolchain + resolved commit** (e.g. `smt — v4.29.0 @7d1d823`),
visible in the table itself. Documented caveat: across mathlib versions a tactic's
pass/fail can shift because available lemmas / simp sets changed, not because the
tactic improved. The `ENV` bucket catches non-compiling theorems; compiling-but-different
is inherent to the request and is noted, not hidden.

## Phased execution (fail cheap)

- **Phase 0 (go/no-go):** build + run **smt** end-to-end (riskiest — native cvc5).
  If NNG4+STG4 run, the pattern holds. If not, ~1 hour lost, not a day.
- **Phase 1:** env-error pre-check in `benchmark_core.sh`.
- **Phase 2:** remaining projects (hammer, auto, aesop) + orchestrator.
- **Phase 3:** merge + annotated dashboard.

## Cost / risks

- Each project downloads a full mathlib cache (several GB each) + builds its tool.
  Meaningful disk and wall-clock.
- Native-dep build failures (cvc5 for smt; premise-selection for hammer) are the
  most likely blockers; handled by `BUILD_FAIL` reporting, not by aborting the run.
