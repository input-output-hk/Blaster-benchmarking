-- Small core-only inputs exercise the same extraction and execution path as NNG4.
-- These sorry bodies are benchmark inputs, replaced by each tested tactic.
theorem zero_add (n : Nat) : 0 + n = n := by sorry
theorem add_comm (a b : Nat) : a + b = b + a := by sorry
theorem add_assoc (a b c : Nat) : a + b + c = a + (b + c) := by sorry
