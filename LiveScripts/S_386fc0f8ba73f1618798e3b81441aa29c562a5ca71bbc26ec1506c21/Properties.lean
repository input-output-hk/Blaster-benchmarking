import CardanoLedgerApi.V2
import LiveScripts.S_386fc0f8ba73f1618798e3b81441aa29c562a5ca71bbc26ec1506c21.Script
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
      ¬ isSuccessful (cekExecuteProgram script_386fc0f8ba73f1618798e3b81441aa29c562a5ca71bbc26ec1506c21.script (spendingInputs input) 1000)]
