/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue35.lean#L29
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue35_l29 : ∀ s : String, s = "a\"b" → s.length = 3 := by sorry
