import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.OrderPredicates
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open UPLC.CekMachine
open UPLC.CekValue (CekValue)
open UPLC.Uplc
open Tests.Uplc.Onchain

def processSCOrder : UPLC.Uplc.Program :=
  UPLC.Uplc.Program.Program (UPLC.Uplc.Version.Version 1 1 0)
    (
  UPLC.Uplc.Term.Lam "scMinRatio" (
    UPLC.Uplc.Term.Lam "scMinOperatorFee" (
      UPLC.Uplc.Term.Lam "scMaxOperatorFee" (
        UPLC.Uplc.Term.Lam "scOperatorFeeRatio" (
          UPLC.Uplc.Term.Lam "scBaseFeeBSC" (
            UPLC.Uplc.Term.Lam "scBaseFeeSSC" (
              UPLC.Uplc.Term.Lam "ds" (
                UPLC.Uplc.Term.Lam "minAdaTransfer" (
                  UPLC.Uplc.Term.Lam "@ds_1" (
                    UPLC.Uplc.Term.Case (
                      UPLC.Uplc.Term.Var "ds") [
                      (
                        UPLC.Uplc.Term.Lam "@ds_2" (
                          UPLC.Uplc.Term.Lam "@ds_3" (
                            UPLC.Uplc.Term.Lam "@ds_4" (
                              UPLC.Uplc.Term.Lam "@ds_5" (
                                UPLC.Uplc.Term.Lam "@ds_6" (
                                  UPLC.Uplc.Term.Lam "@ds_7" (
                                    UPLC.Uplc.Term.Case (
                                      UPLC.Uplc.Term.Var "@ds_1") [
                                      (
                                        UPLC.Uplc.Term.Lam "@ds_8" (
                                          UPLC.Uplc.Term.Lam "@ds_9" (
                                            UPLC.Uplc.Term.Lam "@ds_10" (
                                              UPLC.Uplc.Term.Apply (
                                                UPLC.Uplc.Term.Lam "nt" (
                                                  UPLC.Uplc.Term.Apply (
                                                    UPLC.Uplc.Term.Lam "cse" (
                                                      UPLC.Uplc.Term.Apply (
                                                        UPLC.Uplc.Term.Lam "f_buy" (
                                                          UPLC.Uplc.Term.Case (
                                                            UPLC.Uplc.Term.Apply (
                                                              UPLC.Uplc.Term.Apply (
                                                                UPLC.Uplc.Term.Apply (
                                                                  UPLC.Uplc.Term.Apply (
                                                                    UPLC.Uplc.Term.Force (
                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                    UPLC.Uplc.Term.Var "f_buy")) (
                                                                  UPLC.Uplc.Term.Lam "@ds_11" (
                                                                    UPLC.Uplc.Term.Case (
                                                                      UPLC.Uplc.Term.Var "scBaseFeeBSC") [
                                                                      (
                                                                        UPLC.Uplc.Term.Lam "n" (
                                                                          UPLC.Uplc.Term.Lam "d" (
                                                                            UPLC.Uplc.Term.Case (
                                                                              UPLC.Uplc.Term.Var "nt") [
                                                                              (
                                                                                UPLC.Uplc.Term.Lam "n'" (
                                                                                  UPLC.Uplc.Term.Lam "d'" (
                                                                                    UPLC.Uplc.Term.Constr 0 [
                                                                                      (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                            UPLC.Uplc.Term.Var "n")) (
                                                                                          UPLC.Uplc.Term.Var "n'")),
                                                                                      (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                            UPLC.Uplc.Term.Var "d")) (
                                                                                          UPLC.Uplc.Term.Var "d'")),
                                                                                    ]))),
                                                                            ]))),
                                                                    ]))) (
                                                                UPLC.Uplc.Term.Lam "@ds_12" (
                                                                  UPLC.Uplc.Term.Case (
                                                                    UPLC.Uplc.Term.Var "scBaseFeeSSC") [
                                                                    (
                                                                      UPLC.Uplc.Term.Lam "@n_1" (
                                                                        UPLC.Uplc.Term.Lam "@d_1" (
                                                                          UPLC.Uplc.Term.Case (
                                                                            UPLC.Uplc.Term.Var "nt") [
                                                                            (
                                                                              UPLC.Uplc.Term.Lam "@n'_1" (
                                                                                UPLC.Uplc.Term.Lam "@d'_1" (
                                                                                  UPLC.Uplc.Term.Constr 0 [
                                                                                    (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                          UPLC.Uplc.Term.Var "@n_1")) (
                                                                                        UPLC.Uplc.Term.Var "@n'_1")),
                                                                                    (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                          UPLC.Uplc.Term.Var "@d_1")) (
                                                                                        UPLC.Uplc.Term.Var "@d'_1")),
                                                                                  ]))),
                                                                          ]))),
                                                                  ]))) (
                                                              UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)) [
                                                            (
                                                              UPLC.Uplc.Term.Lam "ipv" (
                                                                UPLC.Uplc.Term.Lam "@ipv_1" (
                                                                  UPLC.Uplc.Term.Apply (
                                                                    UPLC.Uplc.Term.Apply (
                                                                      UPLC.Uplc.Term.Apply (
                                                                        UPLC.Uplc.Term.Apply (
                                                                          UPLC.Uplc.Term.Force (
                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                          UPLC.Uplc.Term.Var "f_buy")) (
                                                                        UPLC.Uplc.Term.Lam "@ds_13" (
                                                                          UPLC.Uplc.Term.Apply (
                                                                            UPLC.Uplc.Term.Lam "@nt_1" (
                                                                              UPLC.Uplc.Term.Apply (
                                                                                UPLC.Uplc.Term.Apply (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Force (
                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                          UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1000000000000000000))) (
                                                                                        UPLC.Uplc.Term.Var "@nt_1"))) (
                                                                                    UPLC.Uplc.Term.Lam "@ds_14" (
                                                                                      UPLC.Uplc.Term.Constr 0 [
                                                                                        (
                                                                                          UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Data (PlutusCore.Data.Data.Constr 7 []))),
                                                                                      ]))) (
                                                                                  UPLC.Uplc.Term.Lam "@ds_15" (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Lam "conrep" (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Lam "@nt_2" (
                                                                                            UPLC.Uplc.Term.Case (
                                                                                              UPLC.Uplc.Term.Var "@ds_4") [
                                                                                              (
                                                                                                UPLC.Uplc.Term.Lam "@n_2" (
                                                                                                  UPLC.Uplc.Term.Lam "@d_2" (
                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                      UPLC.Uplc.Term.Lam "@conrep_1" (
                                                                                                        UPLC.Uplc.Term.Case (
                                                                                                          UPLC.Uplc.Term.Var "scMinRatio") [
                                                                                                          (
                                                                                                            UPLC.Uplc.Term.Lam "@n'_2" (
                                                                                                              UPLC.Uplc.Term.Lam "@d'_2" (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Lam "@conrep_2" (
                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                      UPLC.Uplc.Term.Lam "@conrep_3" (
                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                                UPLC.Uplc.Term.Force (
                                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                                        UPLC.Uplc.Term.Var "@conrep_3")) (
                                                                                                                                      UPLC.Uplc.Term.Var "@nt_2"))) (
                                                                                                                                  UPLC.Uplc.Term.Var "@conrep_2"))) (
                                                                                                                              UPLC.Uplc.Term.Lam "@ds_16" (
                                                                                                                                UPLC.Uplc.Term.Constr 0 [
                                                                                                                                  (
                                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.ConstrData) (
                                                                                                                                        UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                                          UPLC.Uplc.Term.Force (
                                                                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MkCons)) (
                                                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IData) (
                                                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                                                              UPLC.Uplc.Term.Lam "r" (
                                                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                                                        UPLC.Uplc.Term.Force (
                                                                                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                                                                UPLC.Uplc.Term.Var "@conrep_3")) (
                                                                                                                                                              UPLC.Uplc.Term.Var "r"))) (
                                                                                                                                                          UPLC.Uplc.Term.Var "@conrep_2"))) (
                                                                                                                                                      UPLC.Uplc.Term.Lam "@ds_17" (
                                                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.AddInteger) (
                                                                                                                                                            UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                                                                                                                                          UPLC.Uplc.Term.Var "r")))) (
                                                                                                                                                    UPLC.Uplc.Term.Lam "@ds_18" (
                                                                                                                                                      UPLC.Uplc.Term.Var "r"))) (
                                                                                                                                                  UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit))) (
                                                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.QuotientInteger) (
                                                                                                                                                  UPLC.Uplc.Term.Var "@conrep_2")) (
                                                                                                                                                UPLC.Uplc.Term.Var "@conrep_3"))))) (
                                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                                                            UPLC.Uplc.Term.Force (
                                                                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MkCons)) (
                                                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IData) (
                                                                                                                                              UPLC.Uplc.Term.Var "@nt_2"))) (UPLC.Uplc.Term.Const (UPLC.Uplc.Const.ConstDataList []))))),
                                                                                                                                ]))) (
                                                                                                                            UPLC.Uplc.Term.Lam "@ds_19" (
                                                                                                                              UPLC.Uplc.Term.Constr 1 [
                                                                                                                                (
                                                                                                                                  UPLC.Uplc.Term.Constr 0 [
                                                                                                                                    (
                                                                                                                                      UPLC.Uplc.Term.Var "@nt_2"),
                                                                                                                                    (
                                                                                                                                      UPLC.Uplc.Term.Var "@nt_1"),
                                                                                                                                    (
                                                                                                                                      UPLC.Uplc.Term.Var "@ds_10"),
                                                                                                                                  ]),
                                                                                                                              ]))) (
                                                                                                                          UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit))) (
                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                          UPLC.Uplc.Term.Var "@d_2")) (
                                                                                                                        UPLC.Uplc.Term.Var "@d'_2")))) (
                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                      UPLC.Uplc.Term.Var "@conrep_1")) (
                                                                                                                    UPLC.Uplc.Term.Var "@n'_2"))))),
                                                                                                        ])) (
                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                          UPLC.Uplc.Term.Var "@nt_1")) (
                                                                                                        UPLC.Uplc.Term.Var "@n_2"))))),
                                                                                            ])) (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.AddInteger) (
                                                                                              UPLC.Uplc.Term.Var "@ds_8")) (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Lam "@r_1" (
                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                        UPLC.Uplc.Term.Force (
                                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                UPLC.Uplc.Term.Var "@ipv_1")) (
                                                                                                              UPLC.Uplc.Term.Var "@r_1"))) (
                                                                                                          UPLC.Uplc.Term.Var "conrep"))) (
                                                                                                      UPLC.Uplc.Term.Lam "@ds_20" (
                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.AddInteger) (
                                                                                                            UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                                                                                          UPLC.Uplc.Term.Var "@r_1")))) (
                                                                                                    UPLC.Uplc.Term.Lam "@ds_21" (
                                                                                                      UPLC.Uplc.Term.Var "@r_1"))) (
                                                                                                  UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit))) (
                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.QuotientInteger) (
                                                                                                  UPLC.Uplc.Term.Var "conrep")) (
                                                                                                UPLC.Uplc.Term.Var "@ipv_1")))))) (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                          UPLC.Uplc.Term.Var "cse")) (
                                                                                        UPLC.Uplc.Term.Var "ipv"))))) (
                                                                                UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit))) (
                                                                            UPLC.Uplc.Term.Apply (
                                                                              UPLC.Uplc.Term.Apply (
                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.AddInteger) (
                                                                                UPLC.Uplc.Term.Var "@ds_9")) (
                                                                              UPLC.Uplc.Term.Var "cse"))))) (
                                                                      UPLC.Uplc.Term.Lam "@ds_22" (
                                                                        UPLC.Uplc.Term.Apply (
                                                                          UPLC.Uplc.Term.Apply (
                                                                            UPLC.Uplc.Term.Apply (
                                                                              UPLC.Uplc.Term.Apply (
                                                                                UPLC.Uplc.Term.Force (
                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                UPLC.Uplc.Term.Apply (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                    UPLC.Uplc.Term.Var "@ds_9")) (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                      UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                    UPLC.Uplc.Term.Var "cse")))) (
                                                                              UPLC.Uplc.Term.Lam "@ds_23" (UPLC.Uplc.Term.Error))) (
                                                                            UPLC.Uplc.Term.Lam "@ds_24" (
                                                                              UPLC.Uplc.Term.Apply (
                                                                                UPLC.Uplc.Term.Lam "@nt_3" (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Lam "@nt_4" (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Lam "@nt_5" (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Lam "@nt_6" (
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
                                                                                                        UPLC.Uplc.Term.Var "@nt_6"))) (
                                                                                                    UPLC.Uplc.Term.Lam "@ds_25" (
                                                                                                      UPLC.Uplc.Term.Constr 0 [
                                                                                                        (
                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.ConstrData) (
                                                                                                              UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 10))) (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Force (
                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MkCons)) (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IData) (
                                                                                                                  UPLC.Uplc.Term.Var "@nt_4"))) (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Force (
                                                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MkCons)) (
                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IData) (
                                                                                                                    UPLC.Uplc.Term.Var "@nt_5"))) (UPLC.Uplc.Term.Const (UPLC.Uplc.Const.ConstDataList []))))),
                                                                                                      ]))) (
                                                                                                  UPLC.Uplc.Term.Lam "@ds_26" (
                                                                                                    UPLC.Uplc.Term.Constr 1 [
                                                                                                      (
                                                                                                        UPLC.Uplc.Term.Constr 0 [
                                                                                                          (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.AddInteger) (
                                                                                                                UPLC.Uplc.Term.Var "@ds_8")) (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.QuotientInteger) (
                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                      UPLC.Uplc.Term.Var "@nt_6")) (
                                                                                                                    UPLC.Uplc.Term.Var "ipv"))) (
                                                                                                                UPLC.Uplc.Term.Var "@ipv_1"))),
                                                                                                          (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.AddInteger) (
                                                                                                                UPLC.Uplc.Term.Var "@ds_9")) (
                                                                                                              UPLC.Uplc.Term.Var "@nt_6")),
                                                                                                          (
                                                                                                            UPLC.Uplc.Term.Var "@ds_10"),
                                                                                                        ]),
                                                                                                    ]))) (
                                                                                                UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit))) (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                    UPLC.Uplc.Term.Force (
                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                        UPLC.Uplc.Term.Var "@nt_5")) (
                                                                                                      UPLC.Uplc.Term.Var "@nt_4"))) (
                                                                                                  UPLC.Uplc.Term.Lam "@ds_27" (
                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                            UPLC.Uplc.Term.Force (
                                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanEqualsInteger) (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                    UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                                                                                                  UPLC.Uplc.Term.Var "scMinOperatorFee"))) (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                  UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                                                                                                UPLC.Uplc.Term.Var "@nt_5")))) (
                                                                                                          UPLC.Uplc.Term.Lam "@ds_28" (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                    UPLC.Uplc.Term.Force (
                                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                            UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                                                          UPLC.Uplc.Term.Var "@ipv_1"))) (
                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                          UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                                                                                                        UPLC.Uplc.Term.Var "ipv")))) (
                                                                                                                  UPLC.Uplc.Term.Lam "@ds_29" (
                                                                                                                    UPLC.Uplc.Term.Case (
                                                                                                                      UPLC.Uplc.Term.Var "scOperatorFeeRatio") [
                                                                                                                      (
                                                                                                                        UPLC.Uplc.Term.Lam "@n'_3" (
                                                                                                                          UPLC.Uplc.Term.Lam "@d'_3" (
                                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                                              UPLC.Uplc.Term.Lam "@conrep_4" (
                                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                                  UPLC.Uplc.Term.Lam "@conrep_5" (
                                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                                                                        UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
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
                                                                                                                                                  UPLC.Uplc.Term.Var "@conrep_4"))) (
                                                                                                                                              UPLC.Uplc.Term.Lam "@ds_30" (UPLC.Uplc.Term.Error))) (
                                                                                                                                            UPLC.Uplc.Term.Lam "@ds_31" (
                                                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                                                      UPLC.Uplc.Term.Force (
                                                                                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                                                                          UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                                                                          UPLC.Uplc.Term.Var "@conrep_4")) (
                                                                                                                                                        UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0)))) (
                                                                                                                                                    UPLC.Uplc.Term.Lam "@ds_32" (
                                                                                                                                                      UPLC.Uplc.Term.Constr 0 [
                                                                                                                                                        (
                                                                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                                                                                              UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                                                                                            UPLC.Uplc.Term.Var "@conrep_5")),
                                                                                                                                                        (
                                                                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                                                                                              UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                                                                                            UPLC.Uplc.Term.Var "@conrep_4")),
                                                                                                                                                      ]))) (
                                                                                                                                                  UPLC.Uplc.Term.Lam "@ds_33" (
                                                                                                                                                    UPLC.Uplc.Term.Constr 0 [
                                                                                                                                                      (
                                                                                                                                                        UPLC.Uplc.Term.Var "@conrep_5"),
                                                                                                                                                      (
                                                                                                                                                        UPLC.Uplc.Term.Var "@conrep_4"),
                                                                                                                                                    ]))) (
                                                                                                                                                UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                                                                                                                                          UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)) [
                                                                                                                                        (
                                                                                                                                          UPLC.Uplc.Term.Lam "@n'_4" (
                                                                                                                                            UPLC.Uplc.Term.Lam "@d'_4" (
                                                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.QuotientInteger) (
                                                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                                                      UPLC.Uplc.Term.Var "@nt_5")) (
                                                                                                                                                    UPLC.Uplc.Term.Var "@n'_4"))) (
                                                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                                                    UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                                                                                                                                  UPLC.Uplc.Term.Var "@d'_4"))))),
                                                                                                                                      ]))) (
                                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                                      UPLC.Uplc.Term.Var "@ipv_1")) (
                                                                                                                                    UPLC.Uplc.Term.Var "@d'_3")))) (
                                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                                  UPLC.Uplc.Term.Var "ipv")) (
                                                                                                                                UPLC.Uplc.Term.Var "@n'_3"))))),
                                                                                                                    ]))) (
                                                                                                                UPLC.Uplc.Term.Lam "@ds_34" (
                                                                                                                  UPLC.Uplc.Term.Var "cse"))) (
                                                                                                              UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                                                                                                        UPLC.Uplc.Term.Lam "@ds_35" (
                                                                                                          UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0)))) (
                                                                                                      UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                                                                                                UPLC.Uplc.Term.Lam "@ds_36" (
                                                                                                  UPLC.Uplc.Term.Var "cse"))) (
                                                                                              UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                                                                                        UPLC.Uplc.Term.Apply (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                            UPLC.Uplc.Term.Var "@ds_7")) (
                                                                                          UPLC.Uplc.Term.Var "minAdaTransfer")))) (
                                                                                    UPLC.Uplc.Term.Case (
                                                                                      UPLC.Uplc.Term.Var "scOperatorFeeRatio") [
                                                                                      (
                                                                                        UPLC.Uplc.Term.Lam "@n_3" (
                                                                                          UPLC.Uplc.Term.Lam "@d_3" (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Lam "@conrep_6" (
                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                  UPLC.Uplc.Term.Lam "@r_2" (
                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                      UPLC.Uplc.Term.Lam "@nt_7" (
                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Force (
                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                                    UPLC.Uplc.Term.Var "@nt_7")) (
                                                                                                                  UPLC.Uplc.Term.Var "scMinOperatorFee"))) (
                                                                                                              UPLC.Uplc.Term.Lam "@ds_37" (
                                                                                                                UPLC.Uplc.Term.Var "scMinOperatorFee"))) (
                                                                                                            UPLC.Uplc.Term.Lam "@ds_38" (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                    UPLC.Uplc.Term.Force (
                                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                                        UPLC.Uplc.Term.Var "@nt_7")) (
                                                                                                                      UPLC.Uplc.Term.Var "scMaxOperatorFee"))) (
                                                                                                                  UPLC.Uplc.Term.Var "@nt_7")) (
                                                                                                                UPLC.Uplc.Term.Var "scMaxOperatorFee")))) (
                                                                                                          UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit))) (
                                                                                                      UPLC.Uplc.Term.Apply (
                                                                                                        UPLC.Uplc.Term.Apply (
                                                                                                          UPLC.Uplc.Term.Apply (
                                                                                                            UPLC.Uplc.Term.Apply (
                                                                                                              UPLC.Uplc.Term.Force (
                                                                                                                UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                                      UPLC.Uplc.Term.Var "@d_3")) (
                                                                                                                    UPLC.Uplc.Term.Var "@r_2"))) (
                                                                                                                UPLC.Uplc.Term.Var "@conrep_6"))) (
                                                                                                            UPLC.Uplc.Term.Lam "@ds_39" (
                                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.AddInteger) (
                                                                                                                  UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 1))) (
                                                                                                                UPLC.Uplc.Term.Var "@r_2")))) (
                                                                                                          UPLC.Uplc.Term.Lam "@ds_40" (
                                                                                                            UPLC.Uplc.Term.Var "@r_2"))) (
                                                                                                        UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.QuotientInteger) (
                                                                                                      UPLC.Uplc.Term.Var "@conrep_6")) (
                                                                                                    UPLC.Uplc.Term.Var "@d_3")))) (
                                                                                              UPLC.Uplc.Term.Apply (
                                                                                                UPLC.Uplc.Term.Apply (
                                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                                  UPLC.Uplc.Term.Apply (
                                                                                                    UPLC.Uplc.Term.Apply (
                                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.SubtractInteger) (
                                                                                                      UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                                                                    UPLC.Uplc.Term.Var "@nt_3"))) (
                                                                                                UPLC.Uplc.Term.Var "@n_3"))))),
                                                                                    ]))) (
                                                                                UPLC.Uplc.Term.Apply (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.QuotientInteger) (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                        UPLC.Uplc.Term.Var "cse")) (
                                                                                      UPLC.Uplc.Term.Var "ipv"))) (
                                                                                  UPLC.Uplc.Term.Var "@ipv_1"))))) (
                                                                          UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                                                                    UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))),
                                                          ])) (
                                                        UPLC.Uplc.Term.Apply (
                                                          UPLC.Uplc.Term.Apply (
                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanEqualsInteger) (
                                                            UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0))) (
                                                          UPLC.Uplc.Term.Var "cse")))) (
                                                    UPLC.Uplc.Term.Case (
                                                      UPLC.Uplc.Term.Case (
                                                        UPLC.Uplc.Term.Var "@ds_2") [
                                                        (
                                                          UPLC.Uplc.Term.Lam "m" (
                                                            UPLC.Uplc.Term.Lam "@n_4" (
                                                              UPLC.Uplc.Term.Lam "@ds_41" (
                                                                UPLC.Uplc.Term.Constr 0 [
                                                                  (
                                                                    UPLC.Uplc.Term.Var "m"),
                                                                  (
                                                                    UPLC.Uplc.Term.Var "@n_4"),
                                                                ])))),
                                                        (
                                                          UPLC.Uplc.Term.Lam "@m_1" (
                                                            UPLC.Uplc.Term.Lam "@n_5" (
                                                              UPLC.Uplc.Term.Constr 0 [
                                                                (
                                                                  UPLC.Uplc.Term.Var "@m_1"),
                                                                (
                                                                  UPLC.Uplc.Term.Var "@n_5"),
                                                              ]))),
                                                        (
                                                          UPLC.Uplc.Term.Lam "@n_6" (
                                                            UPLC.Uplc.Term.Lam "@ds_42" (
                                                              UPLC.Uplc.Term.Constr 0 [
                                                                (
                                                                  UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0)),
                                                                (
                                                                  UPLC.Uplc.Term.Var "@n_6"),
                                                              ]))),
                                                        (
                                                          UPLC.Uplc.Term.Lam "@n_7" (
                                                            UPLC.Uplc.Term.Lam "@ds_43" (
                                                              UPLC.Uplc.Term.Constr 0 [
                                                                (
                                                                  UPLC.Uplc.Term.Var "@n_7"),
                                                                (
                                                                  UPLC.Uplc.Term.Const (UPLC.Uplc.Const.Integer 0)),
                                                              ]))),
                                                      ]) [
                                                      (
                                                        UPLC.Uplc.Term.Lam "@n_8" (
                                                          UPLC.Uplc.Term.Lam "@ds_44" (
                                                            UPLC.Uplc.Term.Var "@n_8"))),
                                                    ]))) (
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
                                                          UPLC.Uplc.Term.Var "@ds_9"))) (
                                                      UPLC.Uplc.Term.Lam "@ds_45" (
                                                        UPLC.Uplc.Term.Var "@ds_4"))) (
                                                    UPLC.Uplc.Term.Lam "@ds_46" (
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
                                                                  UPLC.Uplc.Term.Var "@ds_10"))) (
                                                              UPLC.Uplc.Term.Lam "@ds_47" (
                                                                UPLC.Uplc.Term.Constr 0 [
                                                                  (
                                                                    UPLC.Uplc.Term.Var "@ds_8"),
                                                                  (
                                                                    UPLC.Uplc.Term.Var "@ds_9"),
                                                                ]))) (
                                                            UPLC.Uplc.Term.Lam "@ds_48" (
                                                              UPLC.Uplc.Term.Case (
                                                                UPLC.Uplc.Term.Var "scBaseFeeBSC") [
                                                                (
                                                                  UPLC.Uplc.Term.Lam "@n_9" (
                                                                    UPLC.Uplc.Term.Lam "@d_4" (
                                                                      UPLC.Uplc.Term.Apply (
                                                                        UPLC.Uplc.Term.Lam "@conrep_7" (
                                                                          UPLC.Uplc.Term.Constr 0 [
                                                                            (
                                                                              UPLC.Uplc.Term.Apply (
                                                                                UPLC.Uplc.Term.Apply (
                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                  UPLC.Uplc.Term.Var "@ds_8")) (
                                                                                UPLC.Uplc.Term.Var "@d_4")),
                                                                            (
                                                                              UPLC.Uplc.Term.Var "@conrep_7"),
                                                                          ])) (
                                                                        UPLC.Uplc.Term.Apply (
                                                                          UPLC.Uplc.Term.Apply (
                                                                            UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                            UPLC.Uplc.Term.Var "@ds_9")) (
                                                                          UPLC.Uplc.Term.Var "@n_9"))))),
                                                              ]))) (
                                                          UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)) [
                                                        (
                                                          UPLC.Uplc.Term.Lam "@ipv_2" (
                                                            UPLC.Uplc.Term.Lam "@ipv_3" (
                                                              UPLC.Uplc.Term.Apply (
                                                                UPLC.Uplc.Term.Apply (
                                                                  UPLC.Uplc.Term.Apply (
                                                                    UPLC.Uplc.Term.Apply (
                                                                      UPLC.Uplc.Term.Force (
                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.IfThenElse)) (
                                                                      UPLC.Uplc.Term.Case (
                                                                        UPLC.Uplc.Term.Var "@ds_4") [
                                                                        (
                                                                          UPLC.Uplc.Term.Lam "@n_10" (
                                                                            UPLC.Uplc.Term.Lam "@d_5" (
                                                                              UPLC.Uplc.Term.Apply (
                                                                                UPLC.Uplc.Term.Apply (
                                                                                  UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.LessThanInteger) (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                      UPLC.Uplc.Term.Var "@n_10")) (
                                                                                    UPLC.Uplc.Term.Var "@ipv_3"))) (
                                                                                UPLC.Uplc.Term.Apply (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                    UPLC.Uplc.Term.Var "@ipv_2")) (
                                                                                  UPLC.Uplc.Term.Var "@d_5"))))),
                                                                      ])) (
                                                                    UPLC.Uplc.Term.Lam "@ds_49" (
                                                                      UPLC.Uplc.Term.Var "@ds_4"))) (
                                                                  UPLC.Uplc.Term.Lam "@ds_50" (
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
                                                                              UPLC.Uplc.Term.Var "@ds_10"))) (
                                                                          UPLC.Uplc.Term.Lam "@ds_51" (
                                                                            UPLC.Uplc.Term.Constr 0 [
                                                                              (
                                                                                UPLC.Uplc.Term.Var "@ds_8"),
                                                                              (
                                                                                UPLC.Uplc.Term.Var "@ds_9"),
                                                                            ]))) (
                                                                        UPLC.Uplc.Term.Lam "@ds_52" (
                                                                          UPLC.Uplc.Term.Case (
                                                                            UPLC.Uplc.Term.Var "scBaseFeeBSC") [
                                                                            (
                                                                              UPLC.Uplc.Term.Lam "@n_11" (
                                                                                UPLC.Uplc.Term.Lam "@d_6" (
                                                                                  UPLC.Uplc.Term.Apply (
                                                                                    UPLC.Uplc.Term.Lam "@conrep_8" (
                                                                                      UPLC.Uplc.Term.Constr 0 [
                                                                                        (
                                                                                          UPLC.Uplc.Term.Apply (
                                                                                            UPLC.Uplc.Term.Apply (
                                                                                              UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                              UPLC.Uplc.Term.Var "@ds_8")) (
                                                                                            UPLC.Uplc.Term.Var "@d_6")),
                                                                                        (
                                                                                          UPLC.Uplc.Term.Var "@conrep_8"),
                                                                                      ])) (
                                                                                    UPLC.Uplc.Term.Apply (
                                                                                      UPLC.Uplc.Term.Apply (
                                                                                        UPLC.Uplc.Term.Builtin UPLC.Uplc.BuiltinFun.MultiplyInteger) (
                                                                                        UPLC.Uplc.Term.Var "@ds_9")) (
                                                                                      UPLC.Uplc.Term.Var "@n_11"))))),
                                                                          ]))) (
                                                                      UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))) (
                                                                UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))),
                                                      ]))) (
                                                  UPLC.Uplc.Term.Const UPLC.Uplc.Const.Unit)))))),
                                    ]))))))),
                    ]))))))))))


def appliedProcessSCOrder (x : ProcessSCInput) := cekExecuteProgram processSCOrder (orderInputToParams x) 5000

end Tests.Uplc.Onchain.ProcessSCOrder
