import CardanoLedgerApi.V1
import LiveScripts.S_f28cc873561315e2fbb5369a4d8a8453b6b0f1e32f0fe3c12ede381c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f28cc873561315e2fbb5369a4d8a8453b6b0f1e32f0fe3c12ede381c.script (spendingInputs input) 1000)]
