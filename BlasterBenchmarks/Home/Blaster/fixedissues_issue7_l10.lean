/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue7.lean#L10
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue7_l10 {α : Sort u} {t : True → α} {e : ¬ True → α} : (dite True t e) = t True.intro := by sorry
