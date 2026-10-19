/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Metas.lean#L34
   The original proof is replaced by the tactic under test. -/
theorem metas_l34 (R : α → α → Prop) (R_trans : ∀ x y z, R x y → R y z → R x z) (a b c d)
    (hab : R a b) (hbc : R b c) (hcd : R c d) : R a d := by sorry
