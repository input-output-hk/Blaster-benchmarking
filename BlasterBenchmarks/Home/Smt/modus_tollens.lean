/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Prop/ModusTollens.lean
   The original proof is replaced by the tactic under test. -/
theorem modus_tollens (p q : Prop) : ¬q → (p → q) → ¬p := by sorry
