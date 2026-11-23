import CardanoLedgerApi.V3
import LiveScripts.S_720dbe15feb2adadcce4ecdd9dfc1f7291c5fe139e7c79a0703ca5d2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_720dbe15feb2adadcce4ecdd9dfc1f7291c5fe139e7c79a0703ca5d2.script (rewardingInputs ctx) 1000)]
