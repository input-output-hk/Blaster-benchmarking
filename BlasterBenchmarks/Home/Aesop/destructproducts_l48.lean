/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/DestructProducts.lean#L48
   The original proof is replaced by the tactic under test. -/
theorem destructproducts_l48 (x y : α × α) (h: p ∧ (x = y)) : x = y := by sorry
