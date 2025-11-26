import PlutusCore.Integer
import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Syntax
import Auto

set_option auto.smt.trust true
set_option auto.smt true
namespace Tests.Uplc.AddInteger
open PlutusCore.Integer (Integer)
open UPLC.CekMachine
open UPLC.Uplc

/-! # Test cases with Valid result expected -/

set_option warn.sorry false
def addInteger: Program :=
    Program.Program (Version.Version 1 1 0)
    (Term.Lam "x"
      (Term.Lam "y"
        (Term.Apply
          (Term.Apply (Term.Builtin BuiltinFun.AddInteger) (Term.Var "x"))
          (Term.Var "y")
        )
      )
    )

def executeAdd (x : Integer) (y : Integer) : Option Int :=
  executeIntProgram addInteger (intArgs2 x y) 20

theorem addInteger_test1 :
  executeAdd 55 110 = some 165 := by sorry
theorem addInteger_test2 :
  executeAdd (-55) 75 = some 20 := by sorry
theorem addInteger_test3 :
  executeAdd (-124) 124 = some 0 := by sorry
theorem addInteger_spec1 :
  ∀ (x y r : Integer), y ≥ 0 → executeAdd x y = some r → r >= x := by sorry
theorem addInteger_spec2 :
  ∀ (x y r : Integer), x ≥ 0 → executeAdd x y = some r → r >= y := by sorry
theorem addInteger_spec3 :
  ∀ (x y : Integer), executeAdd x y = executeAdd y x := by sorry

def mulDistr: Program :=
   Program.Program (Version.Version 1 1 0)
    (Term.Lam "x"
      (Term.Lam "y"
        (Term.Lam "z"
          (Term.Apply
             ( Term.Apply (Term.Builtin BuiltinFun.AddInteger)
                (Term.Apply
                  (Term.Apply (Term.Builtin BuiltinFun.MultiplyInteger) (Term.Var "x"))
                  (Term.Var "y")
                )
              )
              (Term.Apply
                (Term.Apply (Term.Builtin BuiltinFun.MultiplyInteger) (Term.Var "x"))
                (Term.Var "z")
              )
           )
         )
       )
     )

theorem mulDistr_theorem :
  ∀ (x y z : Integer),
    executeIntProgram mulDistr (intArgs3 x y z) 41 = some (x * (y + z)) := by sorry

def mulOverAdd: Program :=
   Program.Program (Version.Version 1 1 0)
    (Term.Lam "x"
      (Term.Lam "y"
        (Term.Lam "z"
          (Term.Apply
             (Term.Apply (Term.Builtin BuiltinFun.MultiplyInteger) (Term.Var "x"))
             (Term.Apply
               (Term.Apply (Term.Builtin BuiltinFun.AddInteger) (Term.Var "z"))
               (Term.Var "y")
             )
          )
        )
     )
   )

theorem mulDistr_equiv :
  ∀ (x y z : Integer),
    executeIntProgram mulDistr (intArgs3 x y z) 41 =
    executeIntProgram mulOverAdd (intArgs3 x y z) 33 := by sorry

/-! # Test cases with Falsified result expected -/

theorem addInteger_falsified1 :
  ∀ (x y : Integer), executeAdd x y < x := by sorry
theorem addInteger_falsified2 :
  ∀ (x y : Integer), executeAdd x y > x := by sorry

def mulOverSub: Program :=
   Program.Program (Version.Version 1 1 0)
    (Term.Lam "x"
      (Term.Lam "y"
        (Term.Lam "z"
          (Term.Apply
             (Term.Apply (Term.Builtin BuiltinFun.MultiplyInteger) (Term.Var "x"))
             (Term.Apply
               (Term.Apply (Term.Builtin BuiltinFun.SubtractInteger) (Term.Var "z"))
               (Term.Var "y")
             )
          )
        )
     )
   )

theorem mulOverSub_falsified :
  ∀ (x y z : Integer),
    executeIntProgram mulDistr (intArgs3 x y z) 41 =
    executeIntProgram mulOverSub (intArgs3 x y z) 33 := by sorry


end Tests.Uplc.AddInteger
