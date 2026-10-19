/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/AuxDecl.lean#L32
   The original proof is replaced by the tactic under test. -/
theorem auxdecl_l32 (a b : BitVec 1) : (a = 0 ∨ a = 1) ∧ (b = 0 ∨ b = 1) := by sorry
