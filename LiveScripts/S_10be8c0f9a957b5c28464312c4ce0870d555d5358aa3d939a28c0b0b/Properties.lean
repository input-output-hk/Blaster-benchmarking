import CardanoLedgerApi.V2
import LiveScripts.S_10be8c0f9a957b5c28464312c4ce0870d555d5358aa3d939a28c0b0b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_10be8c0f9a957b5c28464312c4ce0870d555d5358aa3d939a28c0b0b.script (rewardingInputs input) 1000)]
