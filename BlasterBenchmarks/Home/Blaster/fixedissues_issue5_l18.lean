/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue5.lean#L18
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue5_l18 : ∀ (a b c d e : Nat), List.foldr (λ x acc => x + acc) 0 [a, b, c, d, e] = a + b + c + d + e := by sorry
