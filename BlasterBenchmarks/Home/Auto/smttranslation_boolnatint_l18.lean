/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BoolNatInt.lean#L18
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_boolnatint_l18 : max (-3) 4 = 4 ∧ min 1 (-2) = -2 := by sorry
