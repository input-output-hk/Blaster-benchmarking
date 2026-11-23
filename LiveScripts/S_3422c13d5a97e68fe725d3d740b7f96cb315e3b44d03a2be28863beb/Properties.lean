import CardanoLedgerApi.V1
import LiveScripts.S_3422c13d5a97e68fe725d3d740b7f96cb315e3b44d03a2be28863beb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3422c13d5a97e68fe725d3d740b7f96cb315e3b44d03a2be28863beb.script (spendingInputs input) 1000)]
