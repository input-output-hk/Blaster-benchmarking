/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Issues/ReconstructArithSumUB.lean#L3
   The original proof is replaced by the tactic under test. -/
theorem issues_reconstructarithsumub_l3 {var_3i : Int} : (var_3i = var_3i' ∧
        var_2i = var_2i' ∧ (¬var_4i ≤ 0 ∧ var_4i + (-1 * var_5i + -1 * var_4i') = 0) ∧ var_5i + -1 * var_5i' = -1) ∧
      var_1i' = true ∧ var_1i = true ∧ var_0i' = 1 ∧ var_0i = 1 ∨
    (var_5i = var_5i' ∧ var_4i = var_4i' ∧ var_3i = var_3i' ∧ var_3i = var_2i' ∧ var_4i ≤ 0) ∧
        var_1i' = true ∧ var_1i = true ∧ var_0i' = 2 ∧ var_0i = 1 ∨
      ((((¬1 ≤ var_5i ∧ var_3i = var_2i') ∧ var_3i = var_3i') ∧ var_4i = var_4i') ∧ var_5i = var_5i') ∧
          var_1i' = true ∧ var_1i = true ∧ var_0i = 3 ∧ var_0i' = 2 ∨
        (var_5i = var_5i' ∧ var_4i = var_4i' ∧ var_3i = var_3i' ∧ 1 ≤ var_5i ∧ var_2i = var_2i') ∧
          var_1i' = true ∧ var_1i = true ∧ var_0i = 3 ∧ var_0i' = 1 →
  ¬(¬0 ≤ var_4i ∨ ¬0 ≤ var_4i ∧ ¬var_0i = 3) →
    ¬(¬0 ≤ var_4i' ∨ ¬0 ≤ var_4i' ∧ ¬var_0i' = 3) → ¬var_0i = 3 ∧ ¬var_5i ≤ 2 → ¬var_0i' = 3 ∧ ¬var_5i' ≤ 2 := by sorry
