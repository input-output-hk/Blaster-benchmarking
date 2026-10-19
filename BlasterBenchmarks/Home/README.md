# Home turf goals

These are small, portable goals selected from the tactic projects' own tests or documentation. Each `.lean` file links to the upstream source revision. The harness replaces its `:= by sorry` proof with every tactic, in that tactic's isolated Lake project. A source project's imports, local lemmas, and tactic-specific hints are deliberately omitted so the statement can be offered to all tactics.

| Suite | Upstream source | Goals |
| --- | --- | ---: |
| BlasterHome | Lean-blaster `Tests/FixedIssues` | 3 |
| SmtHome | lean-smt `Test/Prop` and `Test/Unit` | 3 |
| AutoHome | lean-auto `Test/Test_Regression.lean` | 3 |
| AesopHome | Aesop `AesopTest` | 3 |
| HammerHome | LeanHammer `README.md` | 1 |

LeanHammer currently publishes a smoke example in its repository rather than a separate theorem test suite. `HammerHome` includes that one goal only; it is not a claim that LeanHammer's coverage is limited to this example. The other suites are also samples, not complete upstream test suites.

The report compares solved status on the same suite, goal name, and statement across two runs. Newly added or edited goals are counted separately from progress. A `snapshot.json` on `gh-pages` supplies the previous published run; the compressed initial fallback snapshot represents the October 19, 2026 benchmark run.
