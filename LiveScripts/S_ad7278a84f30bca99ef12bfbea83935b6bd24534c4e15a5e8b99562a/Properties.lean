import CardanoLedgerApi.V2
import LiveScripts.S_ad7278a84f30bca99ef12bfbea83935b6bd24534c4e15a5e8b99562a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ad7278a84f30bca99ef12bfbea83935b6bd24534c4e15a5e8b99562a.script (spendingInputs input) 1000)]
