/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/FixedIssues/Issue12.lean#L9
   The original proof is replaced by the tactic under test. -/
theorem fixedissues_issue12_l9 {c : Bool} {t : c → Prop} {e : ¬ c → Prop} :
  (dite c t e) → ∀ (h : c), t h ∧ ∀ (h : ¬ c), e h := by sorry
