/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BoolNatInt.lean#L20
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_boolnatint_l20 {α β : Type} (f : α → Nat → β → α → Nat) :
  ∀ a b c, f a 1 b c = f a 1 b c := by sorry
