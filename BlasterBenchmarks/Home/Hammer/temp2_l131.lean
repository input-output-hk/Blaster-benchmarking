/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/temp2.lean#L131
   The original proof is replaced by the tactic under test. -/
theorem temp2_l131 (f : Nat → Prop) (h1 : ∀ x : Nat, f (x + x)) (h2 : ¬ f (1 + 1)) : False := by sorry
