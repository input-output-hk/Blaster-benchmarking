import PlutusCore.Integer
import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.PreProcess
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic
import Auto

set_option auto.smt.trust true
set_option auto.smt true
set_option auto.smt.save true in
namespace Tests.Uplc.Fibonacci
open PlutusCore.Integer (Integer)
open UPLC.CekMachine
open UPLC.Uplc

/-! # Test cases with Valid result expected -/

def fibonacciNaiveRecursion : Program :=
 Program.Program (Version.Version 1 1 0)
  ((Term.Lam "i-0_0"
        ((Term.Lam "i-1_1"
              ((Term.Var "i-0_0").Apply
                (Term.Lam "i-2_2" (((Term.Var "i-1_1").Apply (Term.Var "i-1_1")).Apply (Term.Var "i-2_2"))))).Apply
          (Term.Lam "i-3_3"
            ((Term.Var "i-0_0").Apply
              (Term.Lam "i-4_4" (((Term.Var "i-3_3").Apply (Term.Var "i-3_3")).Apply (Term.Var "i-4_4"))))))).Apply
    (Term.Lam "i-5_5"
      (Term.Lam "i-6_6"
        ((Term.Constr 0
                [((Term.Builtin BuiltinFun.LessThanEqualsInteger).Apply (Term.Var "i-6_6")).Apply
                    (Term.Const (Const.Integer (Int.ofNat 1))),
                  (Term.Var "i-6_6").Delay,
                  (((Term.Builtin BuiltinFun.AddInteger).Apply
                          ((Term.Var "i-5_5").Apply
                            (((Term.Builtin BuiltinFun.SubtractInteger).Apply (Term.Var "i-6_6")).Apply
                              (Term.Const (Const.Integer (Int.ofNat 1)))))).Apply
                      ((Term.Var "i-5_5").Apply
                        (((Term.Builtin BuiltinFun.SubtractInteger).Apply (Term.Var "i-6_6")).Apply
                          (Term.Const (Const.Integer (Int.ofNat 2)))))).Delay]).Case
            [(Term.Builtin BuiltinFun.IfThenElse).Force]).Force)))

def fibonacciSeungheonOhSize : Program :=
 Program.Program (Version.Version 1 1 0)
  ((Term.Lam "i-0_0" ((Term.Var "i-0_0").Apply (Term.Var "i-0_0"))).Apply
    (Term.Lam "i-1_1"
      (Term.Lam "i-2_2"
        ((Term.Constr 0
                [((Term.Builtin BuiltinFun.LessThanEqualsInteger).Apply (Term.Var "i-2_2")).Apply
                    (Term.Const (Const.Integer 1)),
                  (Term.Var "i-2_2").Delay,
                  (((Term.Builtin BuiltinFun.AddInteger).Apply
                          (((Term.Var "i-1_1").Apply (Term.Var "i-1_1")).Apply
                            (((Term.Builtin BuiltinFun.SubtractInteger).Apply (Term.Var "i-2_2")).Apply
                              (Term.Const (Const.Integer (Int.ofNat 1)))))).Apply
                      (((Term.Var "i-1_1").Apply (Term.Var "i-1_1")).Apply
                        (((Term.Builtin BuiltinFun.SubtractInteger).Apply (Term.Var "i-2_2")).Apply
                          (Term.Const (Const.Integer 2))))).Delay]).Case
            [(Term.Builtin BuiltinFun.IfThenElse).Force]).Force)))

def executeFibonacci (p : Program) (x : Integer) : Option Int :=
  executeIntProgram p [integerToBuiltin x] 2000

def integerToParams (x : Integer) : List Term := [integerToBuiltin x]
#prep_uplc "compiledSeungheonOhSize" fibonacciSeungheonOhSize [Integer] integerToParams 2000
#prep_uplc "compiledNaiveRecursion" fibonacciNaiveRecursion [Integer] integerToParams 2500

-- Fibonacci 0 = 0
theorem fibonacci0_is_0 :
  executeFibonacci fibonacciSeungheonOhSize 0 = some 0 := by sorry
-- Fibonacci 1 = 1
theorem fibonacci1_is_1 :
  executeFibonacci fibonacciSeungheonOhSize 1 = some 1 := by sorry
-- Fibonacci 2 = 1
theorem fibonacci2_is_1:
  executeFibonacci fibonacciSeungheonOhSize 2 = some 1 := by sorry
-- Fibonacci 3 = 2
theorem fibonacci3_is_2 :
  executeFibonacci fibonacciSeungheonOhSize 3 = some 2 := by sorry
-- Fibonacci 4 = 3
theorem fibonacci4_is_3 :
  executeFibonacci fibonacciSeungheonOhSize 4 = some 3 := by sorry
-- Fibonacci 5 = 5
theorem fibonacci5_is_5 :
  executeFibonacci fibonacciSeungheonOhSize 5 = some 5 := by sorry
-- Fibonacci 6 = 8
theorem fibonacci6_is_8 :
  executeFibonacci fibonacciSeungheonOhSize 6 = some 8 := by sorry
-- Fibonacci 7 = 13
theorem fibonacci7_is_13 :
  executeFibonacci fibonacciSeungheonOhSize 7 = some 13 := by sorry
-- Fibonacci 8 = 21
theorem fibonacci8_is_none :
  executeFibonacci fibonacciSeungheonOhSize 8 = none := by blaster
-- Fibonacci 10 = 55
-- ∀ (n : Integer), n > 1 → Fibonacci n = Fibonacci (n - 1) + Fibonacci (n - 2)
theorem fibonacci_recursion :
  ∀ (n r1 r2 r3 : Integer), n > 1 →
    (fromFrameToInt $ prop_compiledSeungheonOhSize n) = some r1 →
    (fromFrameToInt $ prop_compiledSeungheonOhSize (n - 1)) = some r2 →
    (fromFrameToInt $ prop_compiledSeungheonOhSize (n - 2)) = some r3 →
    r1 = r2 + r3 := by
      set_option auto.smt.trust true in
      set_option auto.smt true in
      auto

-- Equivalence between two implementations
theorem fibonacci_equiv :
  ∀ (n r1 r2 : Integer),
    (fromFrameToInt $ prop_compiledNaiveRecursion n) = some r1 →
    (fromFrameToInt $ prop_compiledSeungheonOhSize n) = some r2 →
    r1 = r2 := by
      set_option auto.smt.trust true in
      set_option auto.smt true in
      auto

end Tests.Uplc.Fibonacci
