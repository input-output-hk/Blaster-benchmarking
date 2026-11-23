import CardanoLedgerApi.V2
import LiveScripts.S_d3bf6c9174e9d7a633c50b7290a431179c8d5a0de31f615f01c2f895.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d3bf6c9174e9d7a633c50b7290a431179c8d5a0de31f615f01c2f895.script (spendingInputs input) 1000)]
