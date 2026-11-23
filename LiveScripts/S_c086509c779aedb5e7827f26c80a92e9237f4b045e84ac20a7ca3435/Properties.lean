import CardanoLedgerApi.V2
import LiveScripts.S_c086509c779aedb5e7827f26c80a92e9237f4b045e84ac20a7ca3435.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c086509c779aedb5e7827f26c80a92e9237f4b045e84ac20a7ca3435.script (spendingInputs input) 1000)]
