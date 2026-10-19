/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Int/Arith.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem int_arith_l3 (n m : Int) (h : 0 < m) : n % m < m := by sorry
