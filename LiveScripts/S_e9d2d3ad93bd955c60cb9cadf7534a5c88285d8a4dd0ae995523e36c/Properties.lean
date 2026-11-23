import CardanoLedgerApi.V2
import LiveScripts.S_e9d2d3ad93bd955c60cb9cadf7534a5c88285d8a4dd0ae995523e36c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e9d2d3ad93bd955c60cb9cadf7534a5c88285d8a4dd0ae995523e36c.script (rewardingInputs input) 1000)]
