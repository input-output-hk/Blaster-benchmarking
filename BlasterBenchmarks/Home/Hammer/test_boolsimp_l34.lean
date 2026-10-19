/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/test_boolSimp.lean#L34
   The original proof is replaced by the tactic under test. -/
theorem test_boolsimp_l34 (p q : Prop) (h : (True = p) = (True = q)) : p = q := by sorry
