/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/BitVec/Add.lean#L5
   The original proof is replaced by the tactic under test. -/
theorem bitvec_add_l5 {x y : BitVec 4} : ¬(x = 11#4 ∧ y = 11#4 ∧ x + y = 15#4) := by sorry
