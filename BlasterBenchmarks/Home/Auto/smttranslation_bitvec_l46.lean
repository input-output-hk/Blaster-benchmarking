/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/SmtTranslation/BitVec.lean#L46
   The original proof is replaced by the tactic under test. -/
theorem smttranslation_bitvec_l46 (x : BitVec 20) (y : BitVec 4) :
  (0#5).rotateRight x.toNat = 0#5 ∧ (0#5).rotateRight y.toNat = 0#5 := by sorry
