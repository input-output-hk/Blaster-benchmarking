import CardanoLedgerApi.V2
import LiveScripts.S_0fa1c9282f06a499d9762a03f9551a754d0ba2e1cad2b3295fea1b5a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0fa1c9282f06a499d9762a03f9551a754d0ba2e1cad2b3295fea1b5a.script (spendingInputs input) 1000)]
