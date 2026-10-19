/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Aesop.lean#L80
   The original proof is replaced by the tactic under test. -/
theorem aesop_l80 (Even : Nat → Prop) (zero : Even 0)
    (plusTwo : ∀ n, Even n → Even (n + 2)) : Even 20 := by sorry
