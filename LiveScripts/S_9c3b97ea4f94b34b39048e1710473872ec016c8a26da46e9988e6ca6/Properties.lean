import CardanoLedgerApi.V1
import LiveScripts.S_9c3b97ea4f94b34b39048e1710473872ec016c8a26da46e9988e6ca6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9c3b97ea4f94b34b39048e1710473872ec016c8a26da46e9988e6ca6.script (spendingInputs input) 1000)]
