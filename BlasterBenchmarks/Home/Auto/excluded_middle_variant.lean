/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/Test_Regression.lean
   The original proof is replaced by the tactic under test. -/
theorem excluded_middle_variant (a b : Prop) : a ∨ b ∨ ¬ a := by sorry
