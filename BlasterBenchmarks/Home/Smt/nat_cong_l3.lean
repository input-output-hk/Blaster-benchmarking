/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Nat/Cong.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem nat_cong_l3 (x y : Nat) (f : Nat → Nat) : x = y → f x = f y := by sorry
