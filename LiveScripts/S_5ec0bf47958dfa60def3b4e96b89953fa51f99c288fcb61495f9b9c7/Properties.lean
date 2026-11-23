import CardanoLedgerApi.V2
import LiveScripts.S_5ec0bf47958dfa60def3b4e96b89953fa51f99c288fcb61495f9b9c7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5ec0bf47958dfa60def3b4e96b89953fa51f99c288fcb61495f9b9c7.script (spendingInputs input) 1000)]
