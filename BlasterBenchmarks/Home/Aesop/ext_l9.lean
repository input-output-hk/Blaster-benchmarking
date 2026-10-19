/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Ext.lean#L9
   The original proof is replaced by the tactic under test. -/
theorem ext_l9 (f g : α → β) (h : ∀ a, f a = g a) : f = g := by sorry
