/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/List.lean#L215
   The original proof is replaced by the tactic under test. -/
theorem list_l215 (a : α) {l l' : List α} : a::l = a::l' ↔ l = l' := by sorry
