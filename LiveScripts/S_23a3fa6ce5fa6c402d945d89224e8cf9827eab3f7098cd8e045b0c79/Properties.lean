import CardanoLedgerApi.V2
import LiveScripts.S_23a3fa6ce5fa6c402d945d89224e8cf9827eab3f7098cd8e045b0c79.Script
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
      ¬ isSuccessful (cekExecuteProgram script_23a3fa6ce5fa6c402d945d89224e8cf9827eab3f7098cd8e045b0c79.script (spendingInputs input) 1000)]
