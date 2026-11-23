import CardanoLedgerApi.V1
import LiveScripts.S_2c0f418d944902f96424cbc65283a18bd16f29386a4912bda3d8f1f8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2c0f418d944902f96424cbc65283a18bd16f29386a4912bda3d8f1f8.script (spendingInputs input) 1000)]
