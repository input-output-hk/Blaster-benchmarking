/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/String.lean#L16
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_string_l16 (a b c : String) (_ : a < b) : c ++ a < c ++ b := by sorry
