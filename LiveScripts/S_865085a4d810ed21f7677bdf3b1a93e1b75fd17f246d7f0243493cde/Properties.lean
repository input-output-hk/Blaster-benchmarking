import CardanoLedgerApi.V2
import LiveScripts.S_865085a4d810ed21f7677bdf3b1a93e1b75fd17f246d7f0243493cde.Script
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
      ¬ isSuccessful (cekExecuteProgram script_865085a4d810ed21f7677bdf3b1a93e1b75fd17f246d7f0243493cde.script (spendingInputs input) 1000)]
