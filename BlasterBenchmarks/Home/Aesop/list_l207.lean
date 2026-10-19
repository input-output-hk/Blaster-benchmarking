/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/List.lean#L207
   The original proof is replaced by the tactic under test. -/
theorem list_l207 {h₁ h₂ : α} {t₁ t₂ : List α} :
      (h₁::t₁) = (h₂::t₂) → t₁ = t₂ := by sorry
