/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue9.lean#L10
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue9_l10 : ∀ (α : Type) (x y : α) (xs ys : List α), [BEq α] → (x :: xs) == (y :: ys) → x == y := by sorry
