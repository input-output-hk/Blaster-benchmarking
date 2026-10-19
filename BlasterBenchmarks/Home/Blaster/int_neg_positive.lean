/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue28.lean
   The original proof is replaced by the tactic under test. -/
theorem int_neg_positive : ∀ (a : Int), a < 0 → 0 < -a := by sorry
