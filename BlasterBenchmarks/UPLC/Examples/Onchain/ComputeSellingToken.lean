import PlutusCore.Integer
import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.Ratio
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ComputeSellingToken
open PlutusCore.Integer (Integer)
open UPLC.CekMachine
open UPLC.Uplc

/-! # Test cases with Valid result expected -/

def computeSellingTokenV1 : UPLC.Uplc.Program :=
  UPLC.Uplc.Program.Program (UPLC.Uplc.Version.Version 1 1 0)
    (
  UPLC.Uplc.Term.Lam "orderFee" (
    UPLC.Uplc.Term.Lam "orderFeeToken" (
      UPLC.Uplc.Term.Lam "u_price_fee" (
        UPLC.Uplc.Term.Lam "n" (
          UPLC.Uplc.Term.Lam "currentFee" (
            UPLC.Uplc.Term.Lam "minOpFee" (
              UPLC.Uplc.Term.Lam "opFeeRatio" (
                UPLC.Uplc.Term.Apply (
                  UPLC.Uplc.Term.Apply (
                    UPLC.Uplc.Term.Apply (
                      UPLC.Uplc.Term.Apply (
                        UPLC.Uplc.Term.Force (
                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                        UPLC.Uplc.Term.Apply (
                          UPLC.Uplc.Term.Apply (
                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                            UPLC.Uplc.Term.Var "orderFee")) (
                          UPLC.Uplc.Term.Var "currentFee"))) (
                      UPLC.Uplc.Term.Lam "ds" (
                        UPLC.Uplc.Term.Apply (
                          UPLC.Uplc.Term.Apply (
                            UPLC.Uplc.Term.Apply (
                              UPLC.Uplc.Term.Apply (
                                UPLC.Uplc.Term.Force (
                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                UPLC.Uplc.Term.Case (
                                  UPLC.Uplc.Term.Var "orderFeeToken") [
                                  (
                                    UPLC.Uplc.Term.Lam "nprime" (
                                      UPLC.Uplc.Term.Lam "dprime" (
                                        UPLC.Uplc.Term.Apply (
                                          UPLC.Uplc.Term.Apply (
                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanEqualsInteger) (
                                            UPLC.Uplc.Term.Apply (
                                              UPLC.Uplc.Term.Apply (
                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                UPLC.Uplc.Term.Var "minOpFee")) (
                                              UPLC.Uplc.Term.Var "dprime"))) (
                                          UPLC.Uplc.Term.Apply (
                                            UPLC.Uplc.Term.Apply (
                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                              UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                            UPLC.Uplc.Term.Var "nprime")))))
                                ])) (
                              UPLC.Uplc.Term.Lam "ds" (
                                UPLC.Uplc.Term.Apply (
                                  UPLC.Uplc.Term.Apply (
                                    UPLC.Uplc.Term.Apply (
                                      UPLC.Uplc.Term.Apply (
                                        UPLC.Uplc.Term.Force (
                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                        UPLC.Uplc.Term.Case (
                                          UPLC.Uplc.Term.Var "u_price_fee") [
                                          (
                                            UPLC.Uplc.Term.Lam "nprime" (
                                              UPLC.Uplc.Term.Lam "dprime" (
                                                UPLC.Uplc.Term.Apply (
                                                  UPLC.Uplc.Term.Apply (
                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                    UPLC.Uplc.Term.Apply (
                                                      UPLC.Uplc.Term.Apply (
                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                        UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                      UPLC.Uplc.Term.Var "dprime"))) (
                                                  UPLC.Uplc.Term.Apply (
                                                    UPLC.Uplc.Term.Apply (
                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                      UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                                    UPLC.Uplc.Term.Var "nprime")))))
                                        ])) (
                                      UPLC.Uplc.Term.Lam "ds" (
                                        UPLC.Uplc.Term.Case (
                                          UPLC.Uplc.Term.Var "u_price_fee") [
                                          (
                                            UPLC.Uplc.Term.Lam "n" (
                                              UPLC.Uplc.Term.Lam "d" (
                                                UPLC.Uplc.Term.Case (
                                                  UPLC.Uplc.Term.Var "opFeeRatio") [
                                                  (
                                                    UPLC.Uplc.Term.Lam "nprime" (
                                                      UPLC.Uplc.Term.Lam "dprime" (
                                                        UPLC.Uplc.Term.Apply (
                                                          UPLC.Uplc.Term.Lam "conrep1" (
                                                            UPLC.Uplc.Term.Apply (
                                                              UPLC.Uplc.Term.Lam "conrep2" (
                                                                UPLC.Uplc.Term.Apply (
                                                                  UPLC.Uplc.Term.Apply (
                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                    UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                  UPLC.Uplc.Term.Case (
                                                                    UPLC.Uplc.Term.Var "orderFeeToken") [
                                                                    (
                                                                      UPLC.Uplc.Term.Lam "n" (
                                                                        UPLC.Uplc.Term.Lam "d" (
                                                                          UPLC.Uplc.Term.Case (
                                                                            UPLC.Uplc.Term.Apply (
                                                                              UPLC.Uplc.Term.Apply (
                                                                                UPLC.Uplc.Term.Apply (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Force (
                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.EqualsInteger) (
                                                                                        UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                      UPLC.Uplc.Term.Var "conrep2"))) (
                                                                                  UPLC.Uplc.Term.Lam "ds" (UPLC.Uplc.Term.Error))) (
                                                                                UPLC.Uplc.Term.Lam "ds" (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Force (
                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                              UPLC.Uplc.Term.Var "conrep2")) (
                                                                                            UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0)))) (
                                                                                        UPLC.Uplc.Term.Lam "ds" (
                                                                                          UPLC.Uplc.Term.Constr 0 [
                                                                                            (
                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                                  UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                                UPLC.Uplc.Term.Var "conrep2")),
                                                                                            (
                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                                  UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                                UPLC.Uplc.Term.Var "conrep1"))
                                                                                          ]))) (
                                                                                      UPLC.Uplc.Term.Lam "ds" (
                                                                                        UPLC.Uplc.Term.Constr 0 [
                                                                                          (
                                                                                            UPLC.Uplc.Term.Var "conrep2"),
                                                                                          (
                                                                                            UPLC.Uplc.Term.Var "conrep1")
                                                                                        ]))) (
                                                                                    UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                                                                              UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)) [
                                                                            (
                                                                              UPLC.Uplc.Term.Lam "nprime" (
                                                                                UPLC.Uplc.Term.Lam "dprime" (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.QuotientInteger) (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                          UPLC.Uplc.Term.Var "n")) (
                                                                                        UPLC.Uplc.Term.Var "nprime"))) (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                        UPLC.Uplc.Term.Var "d")) (
                                                                                      UPLC.Uplc.Term.Var "dprime")))))
                                                                          ])))
                                                                  ]))) (
                                                              UPLC.Uplc.Term.Apply (
                                                                UPLC.Uplc.Term.Apply (
                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                  UPLC.Uplc.Term.Var "d")) (
                                                                UPLC.Uplc.Term.Var "dprime")))) (
                                                          UPLC.Uplc.Term.Apply (
                                                            UPLC.Uplc.Term.Apply (
                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                              UPLC.Uplc.Term.Var "n")) (
                                                            UPLC.Uplc.Term.Var "nprime")))))
                                                ])))
                                        ]))) (
                                    UPLC.Uplc.Term.Lam "ds" (
                                      UPLC.Uplc.Term.Var "n"))) (
                                  UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                            UPLC.Uplc.Term.Lam "ds" (
                              UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0)))) (
                          UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                    UPLC.Uplc.Term.Lam "ds" (
                      UPLC.Uplc.Term.Var "n"))) (
                  UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))))))))

def computeSellingTokenV2 : UPLC.Uplc.Program :=
  UPLC.Uplc.Program.Program (UPLC.Uplc.Version.Version 1 1 0)
    (
  UPLC.Uplc.Term.Apply (
    UPLC.Uplc.Term.Lam "x" (
      UPLC.Uplc.Term.Apply (
        UPLC.Uplc.Term.Lam "@_1" (
          UPLC.Uplc.Term.Apply (
            UPLC.Uplc.Term.Lam "@_2" (
              UPLC.Uplc.Term.Apply (
                UPLC.Uplc.Term.Lam "@_3" (
                  UPLC.Uplc.Term.Lam "@_4" (
                    UPLC.Uplc.Term.Lam "@_5" (
                      UPLC.Uplc.Term.Lam "@_6" (
                        UPLC.Uplc.Term.Lam "@_7" (
                          UPLC.Uplc.Term.Lam "@_8" (
                            UPLC.Uplc.Term.Lam "@_9" (
                              UPLC.Uplc.Term.Lam "@_10" (
                                UPLC.Uplc.Term.Apply (
                                  UPLC.Uplc.Term.Lam "@_11" (
                                    UPLC.Uplc.Term.Apply (
                                      UPLC.Uplc.Term.Lam "@_12" (
                                        UPLC.Uplc.Term.Apply (
                                          UPLC.Uplc.Term.Lam "@_13" (
                                            UPLC.Uplc.Term.Apply (
                                              UPLC.Uplc.Term.Lam "@_14" (
                                                UPLC.Uplc.Term.Apply (
                                                  UPLC.Uplc.Term.Lam "@_15" (
                                                    UPLC.Uplc.Term.Apply (
                                                      UPLC.Uplc.Term.Lam "@_16" (
                                                        UPLC.Uplc.Term.Force (
                                                          UPLC.Uplc.Term.Case (
                                                            UPLC.Uplc.Term.Constr 0 [
                                                              (
                                                                UPLC.Uplc.Term.Apply (
                                                                  UPLC.Uplc.Term.Apply (
                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                    UPLC.Uplc.Term.Var "@_4")) (
                                                                  UPLC.Uplc.Term.Var "@_8")),
                                                              (
                                                                UPLC.Uplc.Term.Delay (
                                                                  UPLC.Uplc.Term.Force (
                                                                    UPLC.Uplc.Term.Case (
                                                                      UPLC.Uplc.Term.Constr 0 [
                                                                        (
                                                                          UPLC.Uplc.Term.Apply (
                                                                            UPLC.Uplc.Term.Apply (
                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanEqualsInteger) (
                                                                              UPLC.Uplc.Term.Var "@_9")) (
                                                                            UPLC.Uplc.Term.Var "@_4")),
                                                                        (
                                                                          UPLC.Uplc.Term.Delay (
                                                                            UPLC.Uplc.Term.Force (
                                                                              UPLC.Uplc.Term.Case (
                                                                                UPLC.Uplc.Term.Constr 0 [
                                                                                  (
                                                                                    UPLC.Uplc.Term.Force (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Lam "@_17" (
                                                                                            UPLC.Uplc.Term.Lam "@_18" (
                                                                                              UPLC.Uplc.Term.Case (
                                                                                                UPLC.Uplc.Term.Constr 0 [
                                                                                                  (
                                                                                                    UPLC.Uplc.Term.Var "@_17"),
                                                                                                  (
                                                                                                    UPLC.Uplc.Term.Var "@_18"),
                                                                                                  (
                                                                                                    UPLC.Uplc.Term.Delay (UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Bool False))),
                                                                                                ]) [
                                                                                                (
                                                                                                  UPLC.Uplc.Term.Var "@_3"),
                                                                                              ]))) (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                              UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                            UPLC.Uplc.Term.Var "@_13"))) (
                                                                                        UPLC.Uplc.Term.Delay (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                              UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                            UPLC.Uplc.Term.Var "@_14"))))),
                                                                                  (
                                                                                    UPLC.Uplc.Term.Delay (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Lam "@_19" (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                              UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                            UPLC.Uplc.Term.Var "@_19"))) (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.QuotientInteger) (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                UPLC.Uplc.Term.Var "@_4")) (
                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                  UPLC.Uplc.Term.Var "@_14")) (
                                                                                                UPLC.Uplc.Term.Var "@_16")))) (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                              UPLC.Uplc.Term.Var "@_12")) (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                UPLC.Uplc.Term.Var "@_13")) (
                                                                                              UPLC.Uplc.Term.Var "@_15")))))),
                                                                                  (
                                                                                    UPLC.Uplc.Term.Delay (
                                                                                      UPLC.Uplc.Term.Var "@_7")),
                                                                                ]) [
                                                                                (
                                                                                  UPLC.Uplc.Term.Var "@_3"),
                                                                              ]))),
                                                                        (
                                                                          UPLC.Uplc.Term.Delay (
                                                                            UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))),
                                                                      ]) [
                                                                      (
                                                                        UPLC.Uplc.Term.Var "@_3"),
                                                                    ]))),
                                                              (
                                                                UPLC.Uplc.Term.Delay (
                                                                  UPLC.Uplc.Term.Var "@_7")),
                                                            ]) [
                                                            (
                                                              UPLC.Uplc.Term.Var "@_3"),
                                                          ]))) (
                                                      UPLC.Uplc.Term.Apply (
                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnIData) (
                                                        UPLC.Uplc.Term.Apply (
                                                          UPLC.Uplc.Term.Var "@_1") (
                                                          UPLC.Uplc.Term.Apply (
                                                            UPLC.Uplc.Term.Var "@_2") (
                                                            UPLC.Uplc.Term.Apply (
                                                              UPLC.Uplc.Term.Var "x") (
                                                              UPLC.Uplc.Term.Apply (
                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnConstrData) (
                                                                UPLC.Uplc.Term.Var "@_10")))))))) (
                                                  UPLC.Uplc.Term.Apply (
                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnIData) (
                                                    UPLC.Uplc.Term.Apply (
                                                      UPLC.Uplc.Term.Var "@_1") (
                                                      UPLC.Uplc.Term.Apply (
                                                        UPLC.Uplc.Term.Var "x") (
                                                        UPLC.Uplc.Term.Apply (
                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnConstrData) (
                                                          UPLC.Uplc.Term.Var "@_10"))))))) (
                                              UPLC.Uplc.Term.Apply (
                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnIData) (
                                                UPLC.Uplc.Term.Apply (
                                                  UPLC.Uplc.Term.Var "@_1") (
                                                  UPLC.Uplc.Term.Apply (
                                                    UPLC.Uplc.Term.Var "@_2") (
                                                    UPLC.Uplc.Term.Apply (
                                                      UPLC.Uplc.Term.Var "x") (
                                                      UPLC.Uplc.Term.Apply (
                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnConstrData) (
                                                        UPLC.Uplc.Term.Var "@_6")))))))) (
                                          UPLC.Uplc.Term.Apply (
                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnIData) (
                                            UPLC.Uplc.Term.Apply (
                                              UPLC.Uplc.Term.Var "@_1") (
                                              UPLC.Uplc.Term.Apply (
                                                UPLC.Uplc.Term.Var "x") (
                                                UPLC.Uplc.Term.Apply (
                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnConstrData) (
                                                  UPLC.Uplc.Term.Var "@_6"))))))) (
                                      UPLC.Uplc.Term.Apply (
                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnIData) (
                                        UPLC.Uplc.Term.Apply (
                                          UPLC.Uplc.Term.Var "@_1") (
                                          UPLC.Uplc.Term.Apply (
                                            UPLC.Uplc.Term.Var "@_2") (
                                            UPLC.Uplc.Term.Apply (
                                              UPLC.Uplc.Term.Var "x") (
                                              UPLC.Uplc.Term.Apply (
                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnConstrData) (
                                                UPLC.Uplc.Term.Var "@_5")))))))) (
                                  UPLC.Uplc.Term.Apply (
                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnIData) (
                                    UPLC.Uplc.Term.Apply (
                                      UPLC.Uplc.Term.Var "@_1") (
                                      UPLC.Uplc.Term.Apply (
                                        UPLC.Uplc.Term.Var "x") (
                                        UPLC.Uplc.Term.Apply (
                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.UnConstrData) (
                                          UPLC.Uplc.Term.Var "@_5")))))))))))))) (
                UPLC.Uplc.Term.Force (
                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)))) (
            UPLC.Uplc.Term.Force (
              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.TailList)))) (
        UPLC.Uplc.Term.Force (
          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.HeadList)))) (
    UPLC.Uplc.Term.Force (
      UPLC.Uplc.Term.Force (
        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SndPair))))

structure ComputeInput where
  providedTotalFees : Integer
  providedSellFees : Ratio
  price : Ratio
  nbTokens : Integer
  expectedFees : Integer
  minOpFees : Integer
  opFeeRatio : Ratio

def funArgsV1 (x : ComputeInput) : List Term :=
    [ integerToBuiltin x.providedTotalFees, ratioToConstr x.providedSellFees,
      ratioToConstr x.price, integerToBuiltin x.nbTokens, integerToBuiltin x.expectedFees,
      integerToBuiltin x.minOpFees, ratioToConstr x.opFeeRatio
    ]

def funArgsV2 (x : ComputeInput) : List Term :=
    [ integerToBuiltin x.providedTotalFees, ratioToData x.providedSellFees,
      ratioToData x.price, integerToBuiltin x.nbTokens, integerToBuiltin x.expectedFees,
      integerToBuiltin x.minOpFees, ratioToData x.opFeeRatio
    ]

def appliedComputeSellingTokenV1 (x : ComputeInput) :=
    fromFrameToInt $ cekExecuteProgram computeSellingTokenV1 (funArgsV1 x) 20000

def appliedComputeSellingTokenV2 (x : ComputeInput) :=
    fromFrameToInt $ cekExecuteProgram computeSellingTokenV2 (funArgsV2  x) 20000

def validInput (x : ComputeInput) : Prop :=
  validRatio x.providedSellFees ∧
  validRatio x.price ∧
  x.nbTokens < 0 ∧
  x.minOpFees > 0 ∧
  validRatio x.opFeeRatio ∧
  x.providedSellFees < fromInteger x.providedTotalFees ∧
  zeroRatio < x.providedSellFees ∧
  zeroRatio ≤ x.price ∧
  zeroRatio < x.opFeeRatio ∧
  x.opFeeRatio ≤ oneRatio ∧
  x.expectedFees = ceil (fromInteger (truncate (fromInteger (-x.nbTokens) * x.price)) * x.opFeeRatio)

set_option warn.sorry false

-- Adjusted selling token always ≤ 0.
theorem selling_token_leq_zero :
  ∀ (x : ComputeInput) (res : Integer),
      validInput x → appliedComputeSellingTokenV1 x = some res → res ≤ 0 := by sorry

-- Selling token not adjusted when sufficient operator's fees provided
theorem sufficient_operator_fees :
  ∀ (x : ComputeInput),
    validInput x → x.providedTotalFees ≥ x.expectedFees →
    appliedComputeSellingTokenV1 x = some x.nbTokens := by sorry

-- Tokens can't be sold (i.e., result set to zero) when operator's fees
-- provided is less than min operator's fees.
theorem operators_fees_lt_min_fees :
    ∀ (x : ComputeInput),
      validInput x → x.providedTotalFees < x.expectedFees →
      x.providedSellFees < fromInteger x.minOpFees →
      appliedComputeSellingTokenV1 x = some 0 := by sorry

-- All tokens can be sold when the current selling price is zero
-- (i.e., after deducting selling fees).
theorem selling_price_zero :
    ∀ (x : ComputeInput),
      validInput x → x.price ≤ zeroRatio →
      appliedComputeSellingTokenV1 x = some x.nbTokens := by sorry

-- Selling tokens properly adjuted when the provided operator's fees
-- is less than the expected fees but still greater than or equal to min operator's fees.
theorem selling_tokens_adjusted :
     ∀ (x : ComputeInput),
       let res := truncate $ x.providedSellFees * (recip $ x.price * x.opFeeRatio)
       validInput x →
       x.providedTotalFees < x.expectedFees →
       fromInteger x.minOpFees ≤ x.providedSellFees →
       zeroRatio < x.price →
       appliedComputeSellingTokenV1 x = some (-res) := by sorry

-- The adjusted number of selling tokens corresponds to the maximum number of
-- tokens that can be sold according to the number of operator's fees provided.
theorem adjusted_tokens_eq_max_possible_tokens :
     ∀ (x : ComputeInput),
       let res := truncate $ x.providedSellFees * (recip $ x.price * x.opFeeRatio)
       validInput x →
       x.providedTotalFees < x.expectedFees →
       fromInteger x.minOpFees ≤ x.providedSellFees →
       zeroRatio < x.price →
       appliedComputeSellingTokenV1 x = some (-res) →
       x.providedSellFees < (fromInteger (res + 1) * x.price * x.opFeeRatio) := by sorry

-- Equivalence PlutusTx and Plutarch
-- Counterexample expected
theorem equivalence_V1_V2 :
   ∀ (x : ComputeInput),
     validInput x →
     appliedComputeSellingTokenV1 x = appliedComputeSellingTokenV2 x := by sorry

end Tests.Uplc.Onchain.ComputeSellingToken
