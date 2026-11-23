import CardanoLedgerApi.V1
import LiveScripts.S_65302bbfb05636b784c9b95abf6dd619931e7a5c3f3c7b6fb08d2faf.Script
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
      ¬ isSuccessful (cekExecuteProgram script_65302bbfb05636b784c9b95abf6dd619931e7a5c3f3c7b6fb08d2faf.script (spendingInputs input) 1000)]
