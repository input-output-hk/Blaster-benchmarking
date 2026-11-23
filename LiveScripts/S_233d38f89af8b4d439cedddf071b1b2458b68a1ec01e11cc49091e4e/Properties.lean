import CardanoLedgerApi.V3
import LiveScripts.S_233d38f89af8b4d439cedddf071b1b2458b68a1ec01e11cc49091e4e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_233d38f89af8b4d439cedddf071b1b2458b68a1ec01e11cc49091e4e.script (rewardingInputs ctx) 1000)]
