import CardanoLedgerApi.V1
import LiveScripts.S_b56838500bfefcba32d69a6dc280ea1887c950a8be4e4d991f8d1415.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b56838500bfefcba32d69a6dc280ea1887c950a8be4e4d991f8d1415.script (spendingInputs input) 1000)]
