/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Bool/Assoc.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem bool_assoc_l3 (f : Bool → Bool → Bool) (p q r : Bool) :
  f p (f q r) == f (f p q) r := by sorry
