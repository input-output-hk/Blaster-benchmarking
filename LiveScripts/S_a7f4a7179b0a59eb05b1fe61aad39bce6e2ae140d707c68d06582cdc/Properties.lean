import CardanoLedgerApi.V3
import LiveScripts.S_a7f4a7179b0a59eb05b1fe61aad39bce6e2ae140d707c68d06582cdc.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validSpendingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_a7f4a7179b0a59eb05b1fe61aad39bce6e2ae140d707c68d06582cdc.script (spendingInputs ctx) 1000)]
