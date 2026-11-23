import CardanoLedgerApi.V2
import LiveScripts.S_6a0e34af4d51828a50c6f3d4b1610381de87f95d199a143efdcb8123.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6a0e34af4d51828a50c6f3d4b1610381de87f95d199a143efdcb8123.script (spendingInputs input) 1000)]
