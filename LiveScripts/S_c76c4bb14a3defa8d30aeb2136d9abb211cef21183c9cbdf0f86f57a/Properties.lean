import CardanoLedgerApi.V2
import LiveScripts.S_c76c4bb14a3defa8d30aeb2136d9abb211cef21183c9cbdf0f86f57a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c76c4bb14a3defa8d30aeb2136d9abb211cef21183c9cbdf0f86f57a.script (rewardingInputs input) 1000)]
