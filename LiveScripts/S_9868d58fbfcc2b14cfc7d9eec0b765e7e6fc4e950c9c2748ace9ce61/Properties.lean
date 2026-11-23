import CardanoLedgerApi.V1
import LiveScripts.S_9868d58fbfcc2b14cfc7d9eec0b765e7e6fc4e950c9c2748ace9ce61.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9868d58fbfcc2b14cfc7d9eec0b765e7e6fc4e950c9c2748ace9ce61.script (spendingInputs input) 1000)]
