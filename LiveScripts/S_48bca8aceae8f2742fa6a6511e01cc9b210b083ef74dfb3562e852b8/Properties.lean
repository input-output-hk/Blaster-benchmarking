import CardanoLedgerApi.V1
import LiveScripts.S_48bca8aceae8f2742fa6a6511e01cc9b210b083ef74dfb3562e852b8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_48bca8aceae8f2742fa6a6511e01cc9b210b083ef74dfb3562e852b8.script (spendingInputs input) 1000)]
