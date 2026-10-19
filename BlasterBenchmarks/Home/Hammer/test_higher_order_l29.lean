/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/test_higher_order.lean#L29
   The original proof is replaced by the tactic under test. -/
theorem test_higher_order_l29 (t : Type) (g : Prop → t) (h : t → t) (A B : t)
  (eq1 : A ≠ B)
  (eq2 : ∀ y : t → t, h (y B) ≠ h (g False) ∨ h (y A) ≠ h (g True)) : False := by sorry
