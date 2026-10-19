/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/temp2.lean#L77
   The original proof is replaced by the tactic under test. -/
theorem temp2_l77 (b : Bool) : (¬(b = true)) = (b = false) := by sorry
