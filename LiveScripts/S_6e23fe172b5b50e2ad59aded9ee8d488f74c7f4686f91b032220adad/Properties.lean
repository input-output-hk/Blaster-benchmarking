import CardanoLedgerApi.V2
import LiveScripts.S_6e23fe172b5b50e2ad59aded9ee8d488f74c7f4686f91b032220adad.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6e23fe172b5b50e2ad59aded9ee8d488f74c7f4686f91b032220adad.script (spendingInputs input) 1000)]
