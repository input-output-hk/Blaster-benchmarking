/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/test_inhabitationReasoning.lean#L27
   The original proof is replaced by the tactic under test. -/
theorem test_inhabitationreasoning_l27 (mult_Nats : ∃ y : Nat, y ≠ 0)
  (h : ∀ x : Nat, x ≠ 0 → ∃ f : Fin x → Fin x, ∃ y : Fin x, ∀ z : Fin x, (f y ≠ y) ∧ (f z = y)) : False := by sorry
