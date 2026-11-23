import CardanoLedgerApi.V3
import LiveScripts.S_6e5d66c69b0cba0acb4f9b451845764befc3ae27f3affd7524c85e6b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6e5d66c69b0cba0acb4f9b451845764befc3ae27f3affd7524c85e6b.script (spendingInputs ctx) 1000)]
