/- Portable goal adapted from https://github.com/leanprover-community/aesop/blob/29c64c56cc38211d39b306db2df11701e3d3de11/AesopTest/BigStep.lean#L62
   The original proof is replaced by the tactic under test. -/
theorem bigstep_l62 {P Q R : Prop} (hQ : P → Q) (hR : ¬ P → R) : (P ∧ Q ∨ ¬ P ∧ R) := by sorry
