/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Rat/linarith.lean#L63
   The original proof is replaced by the tactic under test. -/
theorem rat_linarith_l63 {x y : Rat} {f : Rat → Rat} : ¬(((1/2 : Rat) = 1/2) ∧ x ≤ y ∧ y ≤ x ∧ ¬f x = f y) := by sorry
