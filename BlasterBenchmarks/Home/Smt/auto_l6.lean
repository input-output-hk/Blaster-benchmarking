/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Auto.lean#L6
   The original proof is replaced by the tactic under test. -/
theorem auto_l6 (x : α) : List.head? [x] = .some x := by sorry
