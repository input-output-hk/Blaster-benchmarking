/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BoolNatInt.lean#L23
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_boolnatint_l23 {α : Type} (f : α → Nat → Nat → α → Nat) :
  ∀ a b c, f a 1 b c = f a 1 b c := by sorry
