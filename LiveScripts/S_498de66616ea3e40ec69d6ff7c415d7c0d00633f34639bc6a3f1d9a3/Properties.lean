import CardanoLedgerApi.V1
import LiveScripts.S_498de66616ea3e40ec69d6ff7c415d7c0d00633f34639bc6a3f1d9a3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_498de66616ea3e40ec69d6ff7c415d7c0d00633f34639bc6a3f1d9a3.script (spendingInputs input) 1000)]
