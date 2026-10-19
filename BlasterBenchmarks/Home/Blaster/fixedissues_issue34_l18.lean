/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue34.lean#L18
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue34_l18 : (-7 : Int).tmod 2 = -1 := by sorry
