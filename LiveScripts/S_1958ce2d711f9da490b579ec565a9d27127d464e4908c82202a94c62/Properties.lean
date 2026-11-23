import CardanoLedgerApi.V1
import LiveScripts.S_1958ce2d711f9da490b579ec565a9d27127d464e4908c82202a94c62.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1958ce2d711f9da490b579ec565a9d27127d464e4908c82202a94c62.script (spendingInputs input) 1000)]
