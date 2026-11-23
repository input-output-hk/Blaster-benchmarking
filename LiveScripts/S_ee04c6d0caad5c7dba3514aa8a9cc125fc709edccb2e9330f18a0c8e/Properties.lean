import CardanoLedgerApi.V1
import LiveScripts.S_ee04c6d0caad5c7dba3514aa8a9cc125fc709edccb2e9330f18a0c8e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ee04c6d0caad5c7dba3514aa8a9cc125fc709edccb2e9330f18a0c8e.script (spendingInputs input) 1000)]
