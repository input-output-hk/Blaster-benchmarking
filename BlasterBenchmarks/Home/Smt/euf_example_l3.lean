/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/EUF/Example.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem euf_example_l3 [Nonempty U] {f : U → U → U} {a b c d : U} : (a = b) → (c = d) → p1 ∧ True → (¬ p1) ∨ (p2 ∧ p3) → (¬ p3) ∨ (¬ (f a c = f b d)) → False := by sorry
