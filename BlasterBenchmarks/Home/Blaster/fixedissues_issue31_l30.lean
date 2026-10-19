/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue31.lean#L30
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue31_l30 :
  (∀ (β : Type u) (x : β) (f : β → Nat), f x > 10) →
  (∀ (α : Type u) (x : α) (f : α → Nat), f x > 10) := by sorry
