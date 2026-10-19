/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BitVec.lean#L21
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_bitvec_l21 (a b c : BitVec 1) : a = b ∨ b = c ∨ c = a := by sorry
