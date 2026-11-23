import CardanoLedgerApi.V3
import LiveScripts.S_b5cb4f6c6cdcc708bdcd75c95b734a9efba377dcc69338218799f910.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: reward; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validRewardingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_b5cb4f6c6cdcc708bdcd75c95b734a9efba377dcc69338218799f910.script (rewardingInputs ctx) 1000)]
