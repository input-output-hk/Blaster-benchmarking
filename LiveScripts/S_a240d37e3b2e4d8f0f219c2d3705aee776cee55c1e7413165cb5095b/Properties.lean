import CardanoLedgerApi.V2
import LiveScripts.S_a240d37e3b2e4d8f0f219c2d3705aee776cee55c1e7413165cb5095b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a240d37e3b2e4d8f0f219c2d3705aee776cee55c1e7413165cb5095b.script (rewardingInputs input) 1000)]
