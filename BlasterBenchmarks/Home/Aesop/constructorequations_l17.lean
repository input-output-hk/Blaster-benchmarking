/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/ConstructorEquations.lean#L17
   The original proof is replaced by the tactic under test. -/
theorem constructorequations_l17 (h : Nat.succ (Nat.succ n) = Nat.succ Nat.zero) : False := by sorry
