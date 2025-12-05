import PlutusCore.Integer
import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Saturate
open PlutusCore.Integer (Integer)
open UPLC.CekMachine
open UPLC.Uplc


set_option warn.sorry false

def ecd : Program :=
UPLC.Uplc.Program.Program
  (UPLC.Uplc.Version.Version 1 1 0)
  (UPLC.Uplc.Term.Apply
    (UPLC.Uplc.Term.Lam "s-0_0" (UPLC.Uplc.Term.Apply (UPLC.Uplc.Term.Var "s-0_0") (UPLC.Uplc.Term.Var "s-0_0")))
    (UPLC.Uplc.Term.Lam
      "s-1_1"
      (UPLC.Uplc.Term.Lam
        "a-2_2"
        (UPLC.Uplc.Term.Lam
          "b-3_3"
          (UPLC.Uplc.Term.Force
            (UPLC.Uplc.Term.Force
              (UPLC.Uplc.Term.Apply
                (UPLC.Uplc.Term.Apply
                  (UPLC.Uplc.Term.Apply
                    (UPLC.Uplc.Term.Force (UPLC.Uplc.Term.Builtin (UPLC.Uplc.BuiltinFun.IfThenElse)))
                    (UPLC.Uplc.Term.Apply
                      (UPLC.Uplc.Term.Apply
                        (UPLC.Uplc.Term.Builtin (UPLC.Uplc.BuiltinFun.EqualsInteger))
                        (UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0)))
                      (UPLC.Uplc.Term.Var "b-3_3")))
                  (UPLC.Uplc.Term.Delay
                    (UPLC.Uplc.Term.Delay
                      (UPLC.Uplc.Term.Force
                        (UPLC.Uplc.Term.Force
                          (UPLC.Uplc.Term.Apply
                            (UPLC.Uplc.Term.Apply
                              (UPLC.Uplc.Term.Apply
                                (UPLC.Uplc.Term.Force (UPLC.Uplc.Term.Builtin (UPLC.Uplc.BuiltinFun.IfThenElse)))
                                (UPLC.Uplc.Term.Apply
                                  (UPLC.Uplc.Term.Apply
                                    (UPLC.Uplc.Term.Builtin (UPLC.Uplc.BuiltinFun.LessThanInteger))
                                    (UPLC.Uplc.Term.Var "a-2_2"))
                                  (UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))))
                              (UPLC.Uplc.Term.Delay
                                (UPLC.Uplc.Term.Delay
                                  (UPLC.Uplc.Term.Apply
                                    (UPLC.Uplc.Term.Apply
                                      (UPLC.Uplc.Term.Builtin (UPLC.Uplc.BuiltinFun.SubtractInteger))
                                      (UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0)))
                                    (UPLC.Uplc.Term.Var "a-2_2")))))
                            (UPLC.Uplc.Term.Delay (UPLC.Uplc.Term.Delay (UPLC.Uplc.Term.Var "a-2_2")))))))))
                (UPLC.Uplc.Term.Delay
                  (UPLC.Uplc.Term.Delay
                    (UPLC.Uplc.Term.Apply
                      (UPLC.Uplc.Term.Apply
                        (UPLC.Uplc.Term.Apply (UPLC.Uplc.Term.Var "s-1_1") (UPLC.Uplc.Term.Var "s-1_1"))
                        (UPLC.Uplc.Term.Var "b-3_3"))
                      (UPLC.Uplc.Term.Apply
                        (UPLC.Uplc.Term.Apply
                          (UPLC.Uplc.Term.Builtin (UPLC.Uplc.BuiltinFun.ModInteger))
                          (UPLC.Uplc.Term.Var "a-2_2"))
                        (UPLC.Uplc.Term.Var "b-3_3"))))))))))))


def appliedEcd (x y : Integer) : Option Int :=
  executeIntProgram ecd [integerToBuiltin x, integerToBuiltin y] 10000

-- NOTE: remove commented test cases once performance issue resolved.
/-- info: some 25 -/
#guard_msgs in
 #eval appliedEcd 100 25

/-- info: some 512 -/
#guard_msgs in
 #eval appliedEcd 2048 1536

theorem ecd_positive :
  ∀ (x y g : Integer), appliedEcd x y = some g → g ≥ 0 := by sorry

theorem ecd_mod_zero :
  ∀ (x y g : Integer), appliedEcd x y = some g →
    Int.fmod x g = 0 ∧ Int.fmod y g = 0 := by sorry

theorem ecd_dvd_max :
  ∀ (x y g : Integer), appliedEcd x y = some g →
    ∀ (d : Integer), d ∣ x ∧ d ∣ y → d ∣ g := by sorry



end Tests.Uplc.Saturate
