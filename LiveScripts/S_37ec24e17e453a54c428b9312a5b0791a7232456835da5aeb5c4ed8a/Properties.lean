import CardanoLedgerApi.V2
import LiveScripts.S_37ec24e17e453a54c428b9312a5b0791a7232456835da5aeb5c4ed8a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_37ec24e17e453a54c428b9312a5b0791a7232456835da5aeb5c4ed8a.script (rewardingInputs input) 1000)]
