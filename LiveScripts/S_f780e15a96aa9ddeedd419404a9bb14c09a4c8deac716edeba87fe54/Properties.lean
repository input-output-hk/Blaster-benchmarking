import CardanoLedgerApi.V2
import LiveScripts.S_f780e15a96aa9ddeedd419404a9bb14c09a4c8deac716edeba87fe54.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f780e15a96aa9ddeedd419404a9bb14c09a4c8deac716edeba87fe54.script (spendingInputs input) 1000)]
