/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtLtArith.lean#L7
   The original proof is replaced by the tactic under test. -/
theorem smt_smtltarith_l7 : ∀ (m n x : Int), m + x < n + x → m < n := by sorry
