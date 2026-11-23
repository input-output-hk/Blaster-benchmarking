import CardanoLedgerApi.V3
import LiveScripts.S_2bf1d406b733988e82bc6bb0dc47917cbd3fbde15d58189bfd24d2aa.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2bf1d406b733988e82bc6bb0dc47917cbd3fbde15d58189bfd24d2aa.script (rewardingInputs ctx) 1000)]
