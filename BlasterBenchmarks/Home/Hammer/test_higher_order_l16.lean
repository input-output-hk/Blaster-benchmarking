/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/test_higher_order.lean#L16
   The original proof is replaced by the tactic under test. -/
theorem test_higher_order_l16
  (three six : (Nat → Nat) → Nat → Nat)
  (succ : ((Nat → Nat) → Nat → Nat) → ((Nat → Nat) → Nat → Nat))
  (hsucc_ax: succ = fun N X Y => X (N X Y))
  (plus mult : ((Nat → Nat) → Nat → Nat) → ((Nat → Nat) → Nat → Nat) → ((Nat → Nat) → Nat → Nat))
  (hmult_ax: mult = fun M N X Y => M (N X) Y)
  (hthree_ax: three = fun X Y => X (X (X Y)))
  (hthm: ¬∃ N, mult N three = three) : False := by sorry
