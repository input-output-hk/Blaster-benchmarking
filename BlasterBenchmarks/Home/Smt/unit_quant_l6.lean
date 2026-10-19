/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Unit/Quant.lean#L6
   The original proof is replaced by the tactic under test. -/
theorem unit_quant_l6 {p q : U → U → Prop} : (∀ x y, p x y ∧ q x y) = ((∀ x y, p x y) ∧ (∀ x y, q x y)) := by sorry
