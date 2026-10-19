/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue20.lean
   The original proof is replaced by the tactic under test. -/
theorem funext_poly {α β : Type} (f g : α → β) : (f = g) = ∀ x, f x = g x := by sorry
