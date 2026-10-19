/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/Inductive.lean#L53
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_inductive_l53 (x y : α) (_ : Option.some x = Option.some y) : x = y := by sorry
