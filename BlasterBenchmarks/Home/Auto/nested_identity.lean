/- Portable goal adapted from https://github.com/leanprover-community/lean-auto/blob/6544cf60e89e363a9e889f6bc88762709ac18b52/Test/Test_Regression.lean
   The original proof is replaced by the tactic under test. -/
theorem nested_identity (a : Nat) (f : Nat → Nat) (H : ∀ x, f x = x) : f a = f (f (f (f (f (f (f (f (f a)))))))) := by sorry
