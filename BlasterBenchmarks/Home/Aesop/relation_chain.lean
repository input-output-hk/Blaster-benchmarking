/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Metas.lean
   The original proof is replaced by the tactic under test. -/
theorem relation_chain (R : α → α → Prop) (R_trans : ∀ x y z, R x y → R y z → R x z) (a b c d : α) (hab : R a b) (hbc : R b c) (hcd : R c d) : R a d := by sorry
