import CardanoLedgerApi.V2
import LiveScripts.S_96f5c1bee23481335ff4aece32fe1dfa1aa40a944a66d2d6edc9a9a5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_96f5c1bee23481335ff4aece32fe1dfa1aa40a944a66d2d6edc9a9a5.script (rewardingInputs input) 1000)]
