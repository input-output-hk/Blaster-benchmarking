import CardanoLedgerApi.V3
import LiveScripts.S_da9bd639aa6f0a63d7cba0992c7638cf2baf80aa5c518ec60550f3ad.Script
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
      ¬ isSuccessful (cekExecuteProgram script_da9bd639aa6f0a63d7cba0992c7638cf2baf80aa5c518ec60550f3ad.script (spendingInputs ctx) 1000)]
