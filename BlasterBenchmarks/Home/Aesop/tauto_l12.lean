/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/Tauto.lean#L12
   The original proof is replaced by the tactic under test. -/
theorem tauto_l12 {α : Type} [LE α] (a b c : α) (x₀ x₁ x₂ : Prop)
 (this1 : x₀ → x₁ → a ≤ c)
 (this2 : x₁ → x₂ → b ≤ a)
 (this3 : x₂ → x₀ → c ≤ b) :
    ((x₀ ∧ ¬b ≤ a) ∧ x₁ ∧ ¬c ≤ b ∨
         (x₁ ∧ ¬c ≤ b) ∧ x₂ ∧ ¬a ≤ c ∨ (x₂ ∧ ¬a ≤ c) ∧ x₀ ∧ ¬b ≤ a ↔
       (x₀ ∧ x₁ ∨ x₁ ∧ x₂ ∨ x₂ ∧ x₀) ∧
         ¬(c ≤ b ∧ b ≤ a ∨ b ≤ a ∧ a ≤ c ∨ a ≤ c ∧ c ≤ b)) := by sorry
