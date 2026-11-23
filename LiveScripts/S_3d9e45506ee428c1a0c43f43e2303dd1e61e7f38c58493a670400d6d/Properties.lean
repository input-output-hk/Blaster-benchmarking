import CardanoLedgerApi.V1
import LiveScripts.S_3d9e45506ee428c1a0c43f43e2303dd1e61e7f38c58493a670400d6d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3d9e45506ee428c1a0c43f43e2303dd1e61e7f38c58493a670400d6d.script (spendingInputs input) 1000)]
