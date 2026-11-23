import CardanoLedgerApi.V1
import LiveScripts.S_3b014432f045df1a2a68ccc4c4540809206a327ed9e69a4fe46d4475.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3b014432f045df1a2a68ccc4c4540809206a327ed9e69a4fe46d4475.script (spendingInputs input) 1000)]
