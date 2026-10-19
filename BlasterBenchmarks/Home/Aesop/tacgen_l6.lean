/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/TacGen.lean#L6
   The original proof is replaced by the tactic under test. -/
theorem tacgen_l6 (a b c : Nat) : a + b + c = c + b + a := by sorry
