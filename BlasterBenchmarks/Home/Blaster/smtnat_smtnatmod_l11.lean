/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtNat/SmtNatMod.lean#L11
   The original proof is replaced by the tactic under test. -/
theorem smtnat_smtnatmod_l11 : ∀ (x : Nat), x % 0 = x := by sorry
