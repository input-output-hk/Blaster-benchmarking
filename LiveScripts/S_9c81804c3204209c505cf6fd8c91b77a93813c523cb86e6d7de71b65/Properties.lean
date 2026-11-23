import CardanoLedgerApi.V1
import LiveScripts.S_9c81804c3204209c505cf6fd8c91b77a93813c523cb86e6d7de71b65.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9c81804c3204209c505cf6fd8c91b77a93813c523cb86e6d7de71b65.script (spendingInputs input) 1000)]
