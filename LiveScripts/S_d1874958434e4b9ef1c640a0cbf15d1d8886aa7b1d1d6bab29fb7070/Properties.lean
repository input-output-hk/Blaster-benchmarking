import CardanoLedgerApi.V2
import LiveScripts.S_d1874958434e4b9ef1c640a0cbf15d1d8886aa7b1d1d6bab29fb7070.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d1874958434e4b9ef1c640a0cbf15d1d8886aa7b1d1d6bab29fb7070.script (spendingInputs input) 1000)]
