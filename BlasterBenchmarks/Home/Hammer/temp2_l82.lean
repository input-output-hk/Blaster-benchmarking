/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/temp2.lean#L82
   The original proof is replaced by the tactic under test. -/
theorem temp2_l82 (b : Bool) : (¬(b = false)) = (b = true) := by sorry
