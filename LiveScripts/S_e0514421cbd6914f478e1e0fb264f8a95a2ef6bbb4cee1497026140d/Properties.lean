import CardanoLedgerApi.V2
import LiveScripts.S_e0514421cbd6914f478e1e0fb264f8a95a2ef6bbb4cee1497026140d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e0514421cbd6914f478e1e0fb264f8a95a2ef6bbb4cee1497026140d.script (rewardingInputs input) 1000)]
