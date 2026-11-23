import CardanoLedgerApi.V2
import LiveScripts.S_26370b459e5eafe6e179c94a39bb1c278657de5c1875fb9c5d1fa0ba.Script
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
      ¬ isSuccessful (cekExecuteProgram script_26370b459e5eafe6e179c94a39bb1c278657de5c1875fb9c5d1fa0ba.script (spendingInputs input) 1000)]
