import CardanoLedgerApi.V2
import LiveScripts.S_1da75fb2d89746a284ecbc7e3f7422af6ad41fe81f76bc20d70cbed9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1da75fb2d89746a284ecbc7e3f7422af6ad41fe81f76bc20d70cbed9.script (spendingInputs input) 1000)]
