import CardanoLedgerApi.V2
import LiveScripts.S_048fdc2d91108f6806c241d778775fe28885c2c6b066a8caa106b022.Script
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
      ¬ isSuccessful (cekExecuteProgram script_048fdc2d91108f6806c241d778775fe28885c2c6b066a8caa106b022.script (rewardingInputs input) 1000)]
