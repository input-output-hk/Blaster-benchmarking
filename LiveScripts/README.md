# Live Cardano scripts

`LiveScripts/` is an additive corpus of Plutus scripts executed on Cardano
mainnet or preprod. The initial `2026-11-23` cohort is a completed seven-day
execution backfill: 2,257 network records, 2,250 distinct script hashes, and
2,030 shared transaction fixtures. It includes old scripts that executed in
the window, not only scripts first published in that window.

Each `S_<hash>/` directory contains the original script CBOR, a `Script.lean`
import through PlutusCoreBlaster, one `Properties.lean` search, and metadata.
`catalog.json` indexes all imported scripts. `cohorts/*.json` freeze script
hash sets so later benchmark runs use a stable denominator. `fixtures/` holds
observed transaction CBOR and metadata for study and regression tests. Exact
script hashes are deduplicated across networks. Similar scripts retain their
own directories and share a structural `cluster_id` only for exploration.

## Property and score

The Lean property searches for a successful CEK execution using a structurally
shaped context. `candidateContext` currently checks only a `Constr 0` value
with two or more fields. It **does not** check the complete version-specific
Cardano ledger `ScriptContext` encoding or transaction consistency.
`#blaster` falsification therefore produces a **candidate**, never a verified
script context on its own. On-chain examples prove those scripts executed in
their recorded transactions; they are fixtures, not Blaster discoveries.

The dashboard turns a script green only for an independently replayed,
ledger-validated Blaster-generated invocation. That verifier is still being
built, so the initial verified count is zero. Timeout or unknown results do
not mean a script is unsatisfiable.

## Import and run

The importer accepts a completed local `BlasterCorpus` export with
`manifest.jsonl`, `scripts/`, and `transactions/`. It recomputes the Cardano
script hash from the language tag and CBOR, checks sizes and identities, and
preserves prior cases when the rolling window changes.

```sh
python3 LiveScripts/import_corpus.py --corpus /path/to/recent-export --cohort YYYY-MM-DD
python3 -m unittest discover -s LiveScripts -p 'test_*.py'
lake build LiveScripts.S_<hash>.Script
python3 LiveScripts/benchmark.py --script <hash> --z3 /path/to/z3 --timeout 90
python3 cardano-dashboard/build.py
```

The search runner requires Z3 5.4 or newer. It limits each Lean process by
wall time and writes raw results under `results/`. `results/latest.json` feeds
candidate, timeout, unknown, and error states to the dashboard. A benchmark
run does not automatically produce a green result or a frontier point.

## Contributing

PRs can improve the context generator, symbolic execution, replay, or ledger
checks. Run comparisons against a frozen cohort. A public frontier event
should identify the PR, its exact verified script hashes, and the replay and
context-validation evidence. Pinned events can annotate the progress curve.
The source dashboard is in `cardano-dashboard/` and builds to its ignored
`dist/` directory.
