/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BitVec.lean#L24
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_bitvec_l24 : (2 : BitVec 7).rotateLeft 3 = (16 : BitVec 7) := by sorry
