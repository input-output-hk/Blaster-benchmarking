# Home turf goals

The five suites contain 50 source-linked goals each. Every tactic runs every suite in its own isolated Lake project, so each tactic faces the others on each source's "home turf". Each `.lean` file links to a pinned upstream source line. The harness replaces its `:= by sorry` proof with the tactic under test.

| Suite | Source | Goals |
| --- | --- | ---: |
| BlasterHome | Lean-blaster tests (`FixedIssues` and `Smt`) | 50 |
| SmtHome | lean-smt tests | 50 |
| AutoHome | lean-auto tests | 50 |
| AesopHome | Aesop tests | 50 |
| HammerHome | LeanHammer README (1) and Duper tests (49) | 50 |

LeanHammer's repository does not publish a theorem test suite. Its README includes one smoke example; the remaining 49 goals come from Duper, a proof search dependency named by LeanHammer. The report labels that source explicitly.

The goals are adapted to stand alone across toolchains. Local imports, declarations, theorem-name references, and tactic-specific hints from the upstream test files are omitted, which can change the proof environment. A successful local elaboration check confirms the statement is well formed on the harness's Lean version; it does not guarantee that each tactic can solve it or that it elaborates unchanged on every tactic's toolchain. Those outcomes are measured by the weekly run.

The report compares solved status on the same suite, goal name, and statement across two runs. Newly added or edited goals are counted separately from progress. A `snapshot.json` on `gh-pages` supplies the previous published run; the compressed initial fallback snapshot represents the October 19, 2026 benchmark run.
