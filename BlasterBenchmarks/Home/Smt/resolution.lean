/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Prop/Resolution.lean
   The original proof is replaced by the tactic under test. -/
theorem resolution (p q r : Prop) : p ∨ q → ¬p ∨ r → q ∨ r := by sorry
