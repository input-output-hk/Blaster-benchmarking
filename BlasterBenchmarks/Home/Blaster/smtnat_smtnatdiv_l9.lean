/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtNat/SmtNatDiv.lean#L9
   The original proof is replaced by the tactic under test. -/
theorem smtnat_smtnatdiv_l9 : ∀ (x y : Nat), x / y = if 0 < y ∧ y ≤ x then (x - y) / y + 1 else 0 := by sorry
