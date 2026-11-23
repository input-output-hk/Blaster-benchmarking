import CardanoLedgerApi.V1
import LiveScripts.S_0237cc313756ebb5bcfc2728f7bdc6a8047b471220a305aa373b278a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0237cc313756ebb5bcfc2728f7bdc6a8047b471220a305aa373b278a.script (spendingInputs input) 1000)]
