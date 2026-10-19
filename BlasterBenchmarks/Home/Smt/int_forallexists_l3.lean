/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Int/ForallExists.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem int_forallexists_l3 : ∀ x : Nat, ∃ y : Int, x ≤ y := by sorry
