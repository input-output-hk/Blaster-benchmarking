import CardanoLedgerApi.V2
import LiveScripts.S_145654898d7429c6a1f6003f6dc303cf7b6ef2d8b36ca3c6060dfc01.Script
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
      ¬ isSuccessful (cekExecuteProgram script_145654898d7429c6a1f6003f6dc303cf7b6ef2d8b36ca3c6060dfc01.script (rewardingInputs input) 1000)]
