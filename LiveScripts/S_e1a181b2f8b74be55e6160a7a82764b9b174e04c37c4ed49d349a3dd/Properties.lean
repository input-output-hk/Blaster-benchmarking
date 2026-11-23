import CardanoLedgerApi.V3
import LiveScripts.S_e1a181b2f8b74be55e6160a7a82764b9b174e04c37c4ed49d349a3dd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e1a181b2f8b74be55e6160a7a82764b9b174e04c37c4ed49d349a3dd.script (spendingInputs ctx) 1000)]
