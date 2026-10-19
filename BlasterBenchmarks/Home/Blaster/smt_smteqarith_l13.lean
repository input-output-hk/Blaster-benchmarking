/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtEqArith.lean#L13
   The original proof is replaced by the tactic under test. -/
theorem smt_smteqarith_l13 : ∀ (n m x: Nat), m < n → m = n + x → 0 = x := by sorry
