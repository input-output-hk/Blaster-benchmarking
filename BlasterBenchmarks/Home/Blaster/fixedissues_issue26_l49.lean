/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue26.lean#L49
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue26_l49 {f : α → β → γ} {i : Nat} :
    (List.zipWith f l₁ l₂)[i]? = (l₁[i]?.map f).bind fun g => l₂[i]?.map g := by sorry
