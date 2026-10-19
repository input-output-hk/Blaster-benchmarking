/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/List.lean#L411
   The original proof is replaced by the tactic under test. -/
theorem list_l411 {l : List α} : l.length = 2 ↔ ∃ a b, l = [a, b] := by sorry
