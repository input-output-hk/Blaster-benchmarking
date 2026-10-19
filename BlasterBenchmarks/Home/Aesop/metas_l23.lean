/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Metas.lean#L23
   The original proof is replaced by the tactic under test. -/
theorem metas_l23 (P Q : α → Prop) (hPQ : ∀ a, P a → Q a) (a : α) (h : P a) : ∃ a, Q a := by sorry
