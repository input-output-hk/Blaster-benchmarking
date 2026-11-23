import CardanoLedgerApi.V1
import LiveScripts.S_4148f01304e9b860e1217ac543e5fab4aa48d6672b54a3fb46b6b9e5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4148f01304e9b860e1217ac543e5fab4aa48d6672b54a3fb46b6b9e5.script (spendingInputs input) 1000)]
