/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/test_boolSimp.lean#L31
   The original proof is replaced by the tactic under test. -/
theorem test_boolsimp_l31 (p q : Prop) (h : (p = True) = (q = True)) : p = q := by sorry
