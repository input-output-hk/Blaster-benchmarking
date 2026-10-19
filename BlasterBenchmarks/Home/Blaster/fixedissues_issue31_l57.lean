/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue31.lean#L57
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue31_l57 :
  (∀ (α : Type u) (β : Type v) (x : α) (f : α → β) (g : β → Nat), g (f x) > 10) →
  (∀ (A : Type u) (B : Type v) (x : A) (m : A → B) (n : B → Nat), n (m x) > 10) := by sorry
