/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Ext.lean#L12
   The original proof is replaced by the tactic under test. -/
theorem ext_l12 (x y : α × β) (h₁ : x.1 = y.1) (h₂ : x.2 = y.2) : x = y := by sorry
