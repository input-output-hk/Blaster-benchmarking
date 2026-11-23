import CardanoLedgerApi.V3
import LiveScripts.S_e10c730b8329e085a338b30a46f426e74e7ee25a83311e0054b4d2ab.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e10c730b8329e085a338b30a46f426e74e7ee25a83311e0054b4d2ab.script (spendingInputs ctx) 1000)]
