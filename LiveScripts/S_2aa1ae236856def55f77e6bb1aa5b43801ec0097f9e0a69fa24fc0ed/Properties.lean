import CardanoLedgerApi.V2
import LiveScripts.S_2aa1ae236856def55f77e6bb1aa5b43801ec0097f9e0a69fa24fc0ed.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2aa1ae236856def55f77e6bb1aa5b43801ec0097f9e0a69fa24fc0ed.script (spendingInputs input) 1000)]
