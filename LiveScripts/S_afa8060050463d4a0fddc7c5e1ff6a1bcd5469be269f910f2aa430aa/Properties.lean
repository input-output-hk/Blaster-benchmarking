import CardanoLedgerApi.V1
import LiveScripts.S_afa8060050463d4a0fddc7c5e1ff6a1bcd5469be269f910f2aa430aa.Script
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
      ¬ isSuccessful (cekExecuteProgram script_afa8060050463d4a0fddc7c5e1ff6a1bcd5469be269f910f2aa430aa.script (spendingInputs input) 1000)]
