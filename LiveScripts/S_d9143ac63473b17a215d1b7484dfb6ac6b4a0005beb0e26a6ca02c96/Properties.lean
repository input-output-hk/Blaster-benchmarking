import CardanoLedgerApi.V2
import LiveScripts.S_d9143ac63473b17a215d1b7484dfb6ac6b4a0005beb0e26a6ca02c96.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d9143ac63473b17a215d1b7484dfb6ac6b4a0005beb0e26a6ca02c96.script (spendingInputs input) 1000)]
