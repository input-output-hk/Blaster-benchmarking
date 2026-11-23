import CardanoLedgerApi.V2
import LiveScripts.S_00487b0ee879c1da2a8a3563d11b0eaadf0400960c4233ab3d2c81c1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_00487b0ee879c1da2a8a3563d11b0eaadf0400960c4233ab3d2c81c1.script (spendingInputs input) 1000)]
