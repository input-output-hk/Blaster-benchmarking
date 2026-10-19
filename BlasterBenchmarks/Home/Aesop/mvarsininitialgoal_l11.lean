/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/MVarsInInitialGoal.lean#L11
   The original proof is replaced by the tactic under test. -/
theorem mvarsininitialgoal_l11 {n m k : Nat} (h : n < m) (h₂ : m < k) : n < k := by sorry
