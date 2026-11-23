import CardanoLedgerApi.V1
import LiveScripts.S_b9cd9c8bcfd186738e1baf77d1c4764b2920b763938b9d357d67ec5e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b9cd9c8bcfd186738e1baf77d1c4764b2920b763938b9d357d67ec5e.script (spendingInputs input) 1000)]
