import CardanoLedgerApi.V3
import LiveScripts.S_2b65d307c0341d9bea9b7081d9b4f5da5e7be92f94461ce26db7b218.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2b65d307c0341d9bea9b7081d9b4f5da5e7be92f94461ce26db7b218.script (spendingInputs ctx) 1000)]
