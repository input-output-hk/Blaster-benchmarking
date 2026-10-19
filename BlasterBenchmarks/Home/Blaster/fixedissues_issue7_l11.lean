/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue7.lean#L11
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue7_l11 {α : Sort u} {t : False → α} {e : ¬ False → α} : (dite False t e) = e not_false := by sorry
