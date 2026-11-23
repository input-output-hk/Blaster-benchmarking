import CardanoLedgerApi.V1
import LiveScripts.S_6d4540eba75625f04c0fdd09cdafb47a3ffecd631895f98f79eda0ec.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6d4540eba75625f04c0fdd09cdafb47a3ffecd631895f98f79eda0ec.script (spendingInputs input) 1000)]
