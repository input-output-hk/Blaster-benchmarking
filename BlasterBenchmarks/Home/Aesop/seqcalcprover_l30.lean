/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/SeqCalcProver.lean#L30
   The original proof is replaced by the tactic under test. -/
theorem seqcalcprover_l30 [DecidableEq α] {xs : List α} {v : α} (h : v ∈ xs)
  : ∃ l r, xs = l ++ v :: r := by sorry
