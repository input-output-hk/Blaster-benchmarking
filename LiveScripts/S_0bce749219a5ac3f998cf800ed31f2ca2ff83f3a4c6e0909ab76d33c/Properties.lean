import CardanoLedgerApi.V2
import LiveScripts.S_0bce749219a5ac3f998cf800ed31f2ca2ff83f3a4c6e0909ab76d33c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0bce749219a5ac3f998cf800ed31f2ca2ff83f3a4c6e0909ab76d33c.script (rewardingInputs input) 1000)]
