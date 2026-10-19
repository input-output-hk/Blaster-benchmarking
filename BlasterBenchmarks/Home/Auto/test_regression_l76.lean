/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/Test_Regression.lean#L76
   The original proof is replaced by the tactic under test. -/
theorem test_regression_l76 (a : α) (p : α → Prop) : (∃ x, p x → r) ↔ ((∀ x, p x) → r) := by sorry
