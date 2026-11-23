import CardanoLedgerApi.V2
import LiveScripts.S_532a2d8680d0e5d8045e0357b6b45d01f7b7dbc9e8bc0b314ef9c1f1.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_532a2d8680d0e5d8045e0357b6b45d01f7b7dbc9e8bc0b314ef9c1f1.script (spendingInputs input) 1000)]
