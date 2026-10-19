/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/Test_Regression.lean#L83
   The original proof is replaced by the tactic under test. -/
theorem test_regression_l83 (OK : Type → Type)
    (inh : ∀ (α : Type), OK α → OK α)
    (h : ∀ (x : OK Nat), x = x) : 1 = 1 := by sorry
