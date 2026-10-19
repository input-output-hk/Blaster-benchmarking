/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtNat/SmtNatDiv.lean#L13
   The original proof is replaced by the tactic under test. -/
theorem smtnat_smtnatdiv_l13 : ∀ (x y : Nat), 0 < x → 1 < y → x / y < x := by sorry
