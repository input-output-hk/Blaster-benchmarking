import CardanoLedgerApi.V1
import LiveScripts.S_eb4a971390c3dfde5008e7224cd1dbef61a17a92a2e4f14efabc9c39.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eb4a971390c3dfde5008e7224cd1dbef61a17a92a2e4f14efabc9c39.script (spendingInputs input) 1000)]
