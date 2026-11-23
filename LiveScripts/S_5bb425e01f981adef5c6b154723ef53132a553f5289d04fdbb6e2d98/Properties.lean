import CardanoLedgerApi.V2
import LiveScripts.S_5bb425e01f981adef5c6b154723ef53132a553f5289d04fdbb6e2d98.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5bb425e01f981adef5c6b154723ef53132a553f5289d04fdbb6e2d98.script (spendingInputs input) 1000)]
