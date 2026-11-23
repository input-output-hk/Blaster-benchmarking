import CardanoLedgerApi.V2
import LiveScripts.S_06527ef9fa190184f1f23cdf2bce2b92dd35a3c30892ecd3fb53b894.Script
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
      ¬ isSuccessful (cekExecuteProgram script_06527ef9fa190184f1f23cdf2bce2b92dd35a3c30892ecd3fb53b894.script (rewardingInputs input) 1000)]
