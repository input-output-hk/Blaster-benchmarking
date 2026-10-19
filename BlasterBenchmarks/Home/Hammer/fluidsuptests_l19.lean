/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/fluidSupTests.lean#L19
   The original proof is replaced by the tactic under test. -/
theorem fluidsuptests_l19 (a c : t) (f g : t → t) (h : t → ((t → t) → t → t) → t)
  (eq1 : f a = c) (eq2 : ∀ y : (t → t) → t → t, h (y (fun x => g (f x)) a) y ≠ h (g c) (fun w x => w x)) :
  False := by sorry
