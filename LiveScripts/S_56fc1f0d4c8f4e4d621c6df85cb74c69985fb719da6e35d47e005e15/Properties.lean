import CardanoLedgerApi.V1
import LiveScripts.S_56fc1f0d4c8f4e4d621c6df85cb74c69985fb719da6e35d47e005e15.Script
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
      ¬ isSuccessful (cekExecuteProgram script_56fc1f0d4c8f4e4d621c6df85cb74c69985fb719da6e35d47e005e15.script (spendingInputs input) 1000)]
