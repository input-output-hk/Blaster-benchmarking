import CardanoLedgerApi.V1
import LiveScripts.S_8ea7024dc1c2a997072f665be8cda2e8c57f4cb59b566225b847c7d8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8ea7024dc1c2a997072f665be8cda2e8c57f4cb59b566225b847c7d8.script (spendingInputs input) 1000)]
