import CardanoLedgerApi.V2
import LiveScripts.S_66e711a4bf9ddf46ff239143870b6893055a4fd4dea9f99fed6665cd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_66e711a4bf9ddf46ff239143870b6893055a4fd4dea9f99fed6665cd.script (rewardingInputs input) 1000)]
