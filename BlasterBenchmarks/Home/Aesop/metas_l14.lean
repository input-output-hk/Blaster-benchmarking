/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Metas.lean#L14
   The original proof is replaced by the tactic under test. -/
theorem metas_l14 (P : α → β → Prop) (a : α) (b : β) (h : P a b) : ∃ a b, P a b := by sorry
