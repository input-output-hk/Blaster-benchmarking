import Auto
set_option auto.smt.save true
set_option auto.smt true

theorem FinN_is_below_n :
  ∀ (n : Nat) (f : Fin n), f < n := by
      set_option trace.auto.smt.printCommands true in
    auto
