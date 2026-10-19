/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/test_inhabitationReasoning.lean#L15
   The original proof is replaced by the tactic under test. -/
theorem test_inhabitationreasoning_l15 (x : Nat) (f : Fin x → Fin x)
  (h : ∃ y : Fin x, ∀ z : Fin x, (f y ≠ y) ∧ (f z = y)) : False := by sorry
