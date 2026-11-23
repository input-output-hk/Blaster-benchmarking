import CardanoLedgerApi.V1
import LiveScripts.S_2c6ba5b2a99a31f859187fdaf4e5fcf69264ad51bc2e5c4f9f042822.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V1
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_2c6ba5b2a99a31f859187fdaf4e5fcf69264ad51bc2e5c4f9f042822.script (spendingInputs input) 1000)]
