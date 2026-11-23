import CardanoLedgerApi.V2
import LiveScripts.S_dae51337a0fdf712decff4aa43c29dbc5902eda76ea55a718a880f6e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dae51337a0fdf712decff4aa43c29dbc5902eda76ea55a718a880f6e.script (spendingInputs input) 1000)]
