import CardanoLedgerApi.V2
import LiveScripts.S_7bb08afe982c7a9ef54f0ab7d2de48d80d27b9650fb1d7083ddf2d7b.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: reward; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : RewardingInput,
    validRewardingContext input →
      ¬ isSuccessful (cekExecuteProgram script_7bb08afe982c7a9ef54f0ab7d2de48d80d27b9650fb1d7083ddf2d7b.script (rewardingInputs input) 1000)]
