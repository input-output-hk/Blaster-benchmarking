/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/BitVec/XorComm.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem bitvec_xorcomm_l3 (x y : BitVec 2) : x ^^^ y = y ^^^ x := by sorry
