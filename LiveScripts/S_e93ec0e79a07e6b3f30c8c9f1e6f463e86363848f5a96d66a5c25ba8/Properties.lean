import CardanoLedgerApi.V1
import LiveScripts.S_e93ec0e79a07e6b3f30c8c9f1e6f463e86363848f5a96d66a5c25ba8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e93ec0e79a07e6b3f30c8c9f1e6f463e86363848f5a96d66a5c25ba8.script (spendingInputs input) 1000)]
