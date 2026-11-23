import CardanoLedgerApi.V2
import LiveScripts.S_cf3128adeac108b4a1eb6c8b76cc67e8a218d5cc161cfcaaf2b445e0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cf3128adeac108b4a1eb6c8b76cc67e8a218d5cc161cfcaaf2b445e0.script (spendingInputs input) 1000)]
