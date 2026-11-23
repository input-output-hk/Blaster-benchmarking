import CardanoLedgerApi.V1
import LiveScripts.S_7d3a6e086e246e7b412e7c9aedfc3ed0cbd01fb18b1f3bda52b39537.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7d3a6e086e246e7b412e7c9aedfc3ed0cbd01fb18b1f3bda52b39537.script (spendingInputs input) 1000)]
