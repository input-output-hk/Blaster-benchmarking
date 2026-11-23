import CardanoLedgerApi.V3
import LiveScripts.S_fe066e4d2fbeb7903666ca21356af699decdfd32ba1e15d3b7f73968.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fe066e4d2fbeb7903666ca21356af699decdfd32ba1e15d3b7f73968.script (spendingInputs ctx) 1000)]
