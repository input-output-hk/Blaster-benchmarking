/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/EUF/Issue100.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem euf_issue100_l3 {α β : Type} (f g : α → β) :
  (f = g) = ∀ x, f x = g x := by sorry
