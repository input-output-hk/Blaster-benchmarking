/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BitVec.lean#L18
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_bitvec_l18 (a b : BitVec 10) : a + b = b + a := by sorry
