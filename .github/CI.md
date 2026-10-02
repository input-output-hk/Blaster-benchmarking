# Benchmark CI

The smoke workflow runs on PRs, main pushes, Mondays and manual dispatch. It
exercises the existing extraction, proof-attempt, CSV, JSON and report-generation
paths in `benchmarks/benchmark.sh` on three small core-only statements with
`omega` and `blaster`. It requires all six attempts to return `OK` with a numeric
elapsed time; missing/duplicate rows, `ENV`, `FAIL`, `TIMEOUT` and dry runs fail CI.
The input `sorry` bodies are benchmark placeholders; the harness replaces them
with each tactic. An `OK` from Blaster is solver evidence, not proof certification.

The isolated Lake project uses the full Blaster SHA in `ci/lean-blaster-revision`
and this repository's Lean toolchain. That baseline is independent of the legacy
root Lake project and the moving-branch leaderboard. Manual runs may supply a full
`blaster_sha`; it must be compatible with the committed toolchain. Update the
baseline deliberately and review the changed results. No result cache is used.

The runner is ubuntu-24.04, Z3 is checksum-verified 4.15.2, and the job has a
30-minute bound. Actions and the elan installer source are pinned; checkouts keep
no credentials and jobs have `contents: read`. The workflow-validation job uses
checksum-verified actionlint 1.7.12. It has two exact compatibility exceptions for
new gh-aw fields (`queue` and `copilot-requests`); other schema errors fail.

Artifacts in `.ci-results/` are retained for 14 days. The benchmark manifest
records the harness SHA, full solver dependency SHA and Lake manifest, suite hash,
Lean/Z3 versions, runner architecture, timeout, parallelism, cache policy, trust
interpretation and each attempt's result. Logs and attempted Lean sources remain
available even on a harness failure. `environment.json` separately records the
repository environment. No leaderboard or README is published by this workflow.

```sh
python3 scripts/ci/test_smoke.py
# Requires bash >=4, this repo's Lean, Z3 4.15.2 and network for the dependency:
python3 scripts/ci/run_smoke.py
python3 scripts/ci/run_smoke.py --blaster-ref <40-character-SHA>
```

This smoke test validates functionality. It does not cover the full benchmark
corpus or prove a timing regression. The next performance stage should run fresh
base/head attempts on identical Lean, Z3, dependencies and suite inputs, record
machine details and repetitions, and report timeout/unknown/environment changes
separately from latency. Shared GitHub runner noise must not become a merge gate.
Use the staged manual CI advisor in Lean-blaster to investigate failed smoke runs;
AI publishing and automatic code contributions remain later rollout stages.
