import Auto
import Solver.Command.Tactic

opaque p : Nat → Prop
opaque q : Nat → Prop

set_option auto.smt.trust true
set_option auto.smt true
set_option auto.smt.save true
theorem p_of_q_1 : q x → p x := by
  set_option trace.auto.smt.printCommands true in
  auto

theorem p_of_q : ∀ (q : Nat → Prop) (p : Nat → Prop), q x → p x := by sorry
