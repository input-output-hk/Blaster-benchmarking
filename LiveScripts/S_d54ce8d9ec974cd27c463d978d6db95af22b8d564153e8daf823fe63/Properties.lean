import CardanoLedgerApi.V1
import LiveScripts.S_d54ce8d9ec974cd27c463d978d6db95af22b8d564153e8daf823fe63.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d54ce8d9ec974cd27c463d978d6db95af22b8d564153e8daf823fe63.script (spendingInputs input) 1000)]
