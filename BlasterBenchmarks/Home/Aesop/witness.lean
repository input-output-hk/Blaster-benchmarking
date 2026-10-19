/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Metas.lean
   The original proof is replaced by the tactic under test. -/
theorem witness (P : α → Prop) (a : α) (h : P a) : ∃ a, P a := by sorry
