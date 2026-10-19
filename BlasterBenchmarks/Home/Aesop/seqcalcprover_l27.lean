/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/SeqCalcProver.lean#L27
   The original proof is replaced by the tactic under test. -/
theorem seqcalcprover_l27 {x : α} {xs : List α} (f : α → β) (h : x ∈ xs) : f x ∈ xs.map f := by sorry
