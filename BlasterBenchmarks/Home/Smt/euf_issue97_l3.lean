/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/EUF/Issue97.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem euf_issue97_l3 {round : Type} [round_dec : DecidableEq round]
  (st_one_a : round → Prop) (st'_one_a : round → Prop)
  (hnext : ∃ r, (∀ (x : round), st'_one_a x = if x = r then True else st_one_a x))
  : True := by sorry
