import CardanoLedgerApi.V3
import LiveScripts.S_33c0a250e3853f858048b6270f5625ee0e31d0d8238bd043d3b71f5c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_33c0a250e3853f858048b6270f5625ee0e31d0d8238bd043d3b71f5c.script (spendingInputs ctx) 1000)]
