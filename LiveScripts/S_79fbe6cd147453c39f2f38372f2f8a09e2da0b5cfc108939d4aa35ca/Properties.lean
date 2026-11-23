import CardanoLedgerApi.V1
import LiveScripts.S_79fbe6cd147453c39f2f38372f2f8a09e2da0b5cfc108939d4aa35ca.Script
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
      ¬ isSuccessful (cekExecuteProgram script_79fbe6cd147453c39f2f38372f2f8a09e2da0b5cfc108939d4aa35ca.script (spendingInputs input) 1000)]
