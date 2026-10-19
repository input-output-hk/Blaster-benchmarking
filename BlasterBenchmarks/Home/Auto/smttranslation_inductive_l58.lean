/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/Inductive.lean#L58
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_inductive_l58 (x : Option α) : Option.orElse x (fun _ => Option.none) = x := by sorry
