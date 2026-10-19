/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/List.lean#L258
   The original proof is replaced by the tactic under test. -/
theorem list_l258 {a : α} {s t : List α} (h₁ : a ∉ s) (h₂ : a ∉ t) : a ∉ s ++ t := by sorry
