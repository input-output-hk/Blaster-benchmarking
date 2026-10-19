/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue18.lean#L13
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue18_l13 : ∀ (x : Nat) (xs : List Nat), !(List.isEmpty xs) → List.head! (List.map (Nat.add x) xs) ≥ x := by sorry
