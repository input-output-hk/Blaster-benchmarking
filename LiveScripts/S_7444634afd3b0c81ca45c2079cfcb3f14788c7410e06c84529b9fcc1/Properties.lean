import CardanoLedgerApi.V2
import LiveScripts.S_7444634afd3b0c81ca45c2079cfcb3f14788c7410e06c84529b9fcc1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7444634afd3b0c81ca45c2079cfcb3f14788c7410e06c84529b9fcc1.script (spendingInputs input) 1000)]
