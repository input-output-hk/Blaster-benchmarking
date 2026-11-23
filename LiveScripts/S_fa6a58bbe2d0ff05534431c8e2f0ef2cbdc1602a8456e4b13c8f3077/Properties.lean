import CardanoLedgerApi.V2
import LiveScripts.S_fa6a58bbe2d0ff05534431c8e2f0ef2cbdc1602a8456e4b13c8f3077.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fa6a58bbe2d0ff05534431c8e2f0ef2cbdc1602a8456e4b13c8f3077.script (spendingInputs input) 1000)]
