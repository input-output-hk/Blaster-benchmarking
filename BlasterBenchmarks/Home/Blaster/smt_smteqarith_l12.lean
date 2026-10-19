/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtEqArith.lean#L12
   The original proof is replaced by the tactic under test. -/
theorem smt_smteqarith_l12 : ∀ (n m x: Nat), n = m → m = n + x → 0 = x := by sorry
