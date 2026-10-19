/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/BitVec/Shift.lean#L5
   The original proof is replaced by the tactic under test. -/
theorem bitvec_shift_l5 (x y : BitVec 2)
    : x ++ y = (x.zeroExtend 4 <<< 2#2) ||| y.zeroExtend 4 := by sorry
