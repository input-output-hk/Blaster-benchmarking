import CardanoLedgerApi.V2
import LiveScripts.S_20413a8a0f57fd67ce5e8a45ce9d8df66bd66db9ceedbfd213ef3fd0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_20413a8a0f57fd67ce5e8a45ce9d8df66bd66db9ceedbfd213ef3fd0.script (rewardingInputs input) 1000)]
