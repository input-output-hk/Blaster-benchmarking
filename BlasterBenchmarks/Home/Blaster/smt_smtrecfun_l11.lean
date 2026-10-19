/- Portable goal adapted from https://github.com/input-output-hk/Lean-blaster/blob/5921ff8ea91edfad04d3b3b890842ab28f08e8cd/Tests/Smt/SmtRecFun.lean#L11
   The original proof is replaced by the tactic under test. -/
theorem smt_smtrecfun_l11 : ∀ (α : Type) (x : α) (xs : List α), List.length xs + 1 = List.length (x :: xs) := by sorry
