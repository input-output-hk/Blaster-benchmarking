/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/fluidSupTests.lean#L13
   The original proof is replaced by the tactic under test. -/
theorem fluidsuptests_l13 (a b c d : t) (f g : t → t)
  (eq1 : f a = c) (eq2 : f b = d) (eq3 : ∀ y : t → t, g c ≠ y a ∨ g d ≠ y b) : False := by sorry
