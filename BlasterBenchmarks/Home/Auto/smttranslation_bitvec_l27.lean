/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BitVec.lean#L27
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_bitvec_l27 : (2 : BitVec 7).rotateRight 3 = (0x20 : BitVec 7) := by sorry
