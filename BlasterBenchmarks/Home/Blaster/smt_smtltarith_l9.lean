/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtLtArith.lean#L9
   The original proof is replaced by the tactic under test. -/
theorem smt_smtltarith_l9 : ∀ (x : Nat), 10 + x < 20 + x := by sorry
