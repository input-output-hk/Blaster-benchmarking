import CardanoLedgerApi.V1
import LiveScripts.S_2d8e5c1fc9dddc236642f3179368584c3294da18872b6d21b3bd0743.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2d8e5c1fc9dddc236642f3179368584c3294da18872b6d21b3bd0743.script (spendingInputs input) 1000)]
