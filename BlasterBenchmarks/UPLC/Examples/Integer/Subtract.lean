import PlutusCore.Integer
import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic
import Auto

namespace Tests.Uplc.SubtractInteger
open PlutusCore.Integer (Integer)
open UPLC.CekMachine
open UPLC.Uplc

set_option auto.smt.trust true
set_option auto.smt true
set_option auto.smt.save true in
/-! # Test cases with Valid result expected -/

def subtractInteger: Program :=
    (Program.Program (Version.Version 1 1 0)
    (Term.Lam "x"
      (Term.Lam "y"
        (Term.Apply
          (Term.Apply (Term.Builtin BuiltinFun.SubtractInteger) (Term.Var "x"))
          (Term.Var "y")
        )
      )
    ))

def executeSubtract (x : Integer) (y : Integer) : Option Integer :=
  executeIntProgram subtractInteger (intArgs2 x y) 20

/-! # Properties of Subtract Integer -/
theorem subtractInteger_spec1 :
  ∀ (x y r : Integer), x < y → executeSubtract x y = some r → r < 0 := by auto
theorem subtractInteger_spec2 :
  ∀ (x y r : Integer), x ≥ y → executeSubtract x y = some r → r ≥ 0 := by auto
theorem subtractInteger_spec3 :
  ∀ (x y r : Integer), x = y → executeSubtract x y = some r → r = 0 := by auto
theorem subtractInteger_spec4 :
  ∀ (x y z r : Integer), x = z + y → executeSubtract x y = some r → r = z := by
    set_option auto.smt.save true in
    set_option trace.auto.smt.printCommands true in
    auto

def absInteger : Program :=
  (Program.Program (Version.Version 1 1 0)
    (Term.Lam "n"
      (Term.Apply
        (Term.Apply
          (Term.Apply
            (Term.Force (Term.Builtin BuiltinFun.IfThenElse))
            (Term.Apply
              (Term.Apply (Term.Builtin BuiltinFun.LessThanInteger) (Term.Var "n"))
              (Term.Const (Const.Integer 0))
            )
          )
          (Term.Apply
            (Term.Apply (Term.Builtin BuiltinFun.SubtractInteger) (Term.Const (Const.Integer 0)))
            (Term.Var "n")
          )
        )
        (Term.Var "n")
      )
    )
)

def executeAbs (x : Integer) : Option Integer :=
  executeIntProgram absInteger [integerToBuiltin x] 37

theorem absInteger_test1 :
  executeAbs (-127) = some 127 := by sorry
theorem absInteger_test2 :
  executeAbs 1200 = some 1200 := by sorry
theorem absInteger_test3 :
  executeAbs 0 = some 0 := by sorry

/-! # Properties of Abs Integer -/
theorem absInteger_spec1 :
  ∀ (x r : Integer), x > 0 → executeAbs x = some r → r = x := by sorry
theorem absInteger_spec2 :
  ∀ (x r : Integer), x ≤ 0 → executeAbs x = some r → r = -x := by sorry

def subOfSub: Program :=
    Program.Program (Version.Version 1 1 0)
    (Term.Lam "x"
      (Term.Lam "y"
        (Term.Lam "z"
          (Term.Apply
             (Term.Apply (Term.Builtin BuiltinFun.SubtractInteger)
               (Term.Apply
                 (Term.Apply (Term.Builtin BuiltinFun.SubtractInteger) (Term.Var "x"))
                 (Term.Var "y")
               )
             )
             (Term.Var "z")
          )
        )
      )
    )

def subOfAdd: Program :=
    Program.Program (Version.Version 1 1 0)
    (Term.Lam "x"
      (Term.Lam "y"
        (Term.Lam "z"
          (Term.Apply
             (Term.Apply (Term.Builtin BuiltinFun.SubtractInteger) (Term.Var "x"))
             (Term.Apply
               (Term.Apply (Term.Builtin BuiltinFun.AddInteger) (Term.Var "y"))
               (Term.Var "z")
             )
          )
        )
      )
    )

/-! equivalence between two uplc programs. -/
theorem subOfSub_equiv :
  ∀ (x y z : Integer),
    executeIntProgram subOfSub (intArgs3 x y z) 33 =
    executeIntProgram subOfAdd (intArgs3 x y z) 33 := by sorry


/-! # Test cases with Falsified result expected -/
theorem subtractInteger_falsified1 :
  ∀ (x y : Integer), executeSubtract x y < x := by sorry
theorem subtractInteger_falsified2 :
  ∀ (x y : Integer), executeSubtract x y > x := by sorry

def subOfMul: Program :=
    Program.Program (Version.Version 1 1 0)
    (Term.Lam "x"
      (Term.Lam "y"
        (Term.Lam "z"
          (Term.Apply
             (Term.Apply (Term.Builtin BuiltinFun.SubtractInteger) (Term.Var "x"))
             (Term.Apply
               (Term.Apply (Term.Builtin BuiltinFun.MultiplyInteger) (Term.Var "y"))
               (Term.Var "z")
             )
          )
        )
      )
    )

/-! Faulsified equivalence between two uplc programs. -/
theorem subOfSub_eq_subOfMul_falsified :
  ∀ (x y z : Integer),
    executeIntProgram subOfSub (intArgs3 x y z) 33 =
    executeIntProgram subOfMul (intArgs3 x y z) 33 := by sorry

end Tests.Uplc.SubtractInteger
