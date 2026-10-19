/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/temp2.lean#L101
   The original proof is replaced by the tactic under test. -/
theorem temp2_l101 {f : α → β} {p : α → Prop} {q : β → Prop} :
  ∃ a, p a ∧ q (f a) → (∃ b, (∃ a, p a ∧ f a = b) ∧ q b) := by sorry
