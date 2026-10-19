/- Portable goal adapted from https://github.com/leanprover-community/duper/blob/5940907b9581beb2fd08b9d0b0682c2b0c9c15b8/Duper/Tests/temp.lean#L29
   The original proof is replaced by the tactic under test. -/
theorem temp_l29 (hFin : ∀ x : Nat, ∀ y : Nat, x < y ↔ ∃ a : Fin x, a.1 = x)
  (lt_succ : ∀ n : Nat, n < n.succ) (lt_trans : ∀ x y z : Nat, x < y → y < z → x < z) :
  ∃ a : Fin (Nat.succ (Nat.succ 0)), a.1 = 0 := by sorry
