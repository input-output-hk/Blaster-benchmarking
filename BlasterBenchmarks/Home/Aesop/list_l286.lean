/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/List.lean#L286
   The original proof is replaced by the tactic under test. -/
theorem list_l286 {a y : α} {l : List α} : a ∉ y::l → a ≠ y ∧ a ∉ l := by sorry
