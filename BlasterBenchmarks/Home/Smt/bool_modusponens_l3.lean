/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Bool/ModusPonens'.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem bool_modusponens_l3 (p q : Bool) (hp : p) (hpq : p → q) : q := by sorry
