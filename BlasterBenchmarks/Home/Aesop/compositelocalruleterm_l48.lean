/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/CompositeLocalRuleTerm.lean#L48
   The original proof is replaced by the tactic under test. -/
theorem compositelocalruleterm_l48 {P : α → Prop} (h₁ : A → x = y) (h₂ : A → y = z) (p : P x) : P z := by sorry
