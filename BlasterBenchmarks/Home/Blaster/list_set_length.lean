/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue27.lean
   The original proof is replaced by the tactic under test. -/
theorem list_set_length {as : List α} {i : Nat} {a : α} : (as.set i a).length = as.length := by sorry
