/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Subst.lean
   The original proof is replaced by the tactic under test. -/
theorem equality_chain {x y z : α} (h₁ : x = y) (h₂ : y = z) : x = z := by sorry
