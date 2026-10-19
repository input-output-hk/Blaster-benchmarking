/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtNat/SmtNatPow.lean#L11
   The original proof is replaced by the tactic under test. -/
theorem smtnat_smtnatpow_l11 : ∀ (x y : Nat), x^y * x = x^(y + 1) := by sorry
