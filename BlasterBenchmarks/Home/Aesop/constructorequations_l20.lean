/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/ConstructorEquations.lean#L20
   The original proof is replaced by the tactic under test. -/
theorem constructorequations_l20 (h : (Nat.succ m, Nat.succ n) = (Nat.succ a, Nat.succ b)) :
    m = a ∧ n = b := by sorry
