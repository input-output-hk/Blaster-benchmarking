import CardanoLedgerApi.V2
import LiveScripts.S_0813a6308bd6fb301d8b12801fe3bb3cc598732b8b62b2f485604177.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0813a6308bd6fb301d8b12801fe3bb3cc598732b8b62b2f485604177.script (spendingInputs input) 1000)]
