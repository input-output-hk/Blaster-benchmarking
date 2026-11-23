import CardanoLedgerApi.V2
import LiveScripts.S_acee18e799d5b4e30046e2eaad1f75fc95997dd6ec37995f02670ccd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_acee18e799d5b4e30046e2eaad1f75fc95997dd6ec37995f02670ccd.script (spendingInputs input) 1000)]
