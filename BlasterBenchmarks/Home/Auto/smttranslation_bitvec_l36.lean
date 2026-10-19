/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BitVec.lean#L36
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_bitvec_l36 :
  434#8 >>> 4 = 0x0b#8 ∧ 434#8 >>> 4#5 = 0x0b#8 ∧
  34#8 >>> 4 = 0x02#8 ∧ 34#8 >>> 4#12 = 0x02#8 ∧
  (434#8).sshiftRight 4 = 0xfb#8 ∧
  (34#8).sshiftRight 4 = 0x02#8 := by sorry
