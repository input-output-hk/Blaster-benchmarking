import CardanoLedgerApi.V2
import LiveScripts.S_279d91a45e494de463bc3701bbd7eba04a13882cfbe2f8d72b2a3ed6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_279d91a45e494de463bc3701bbd7eba04a13882cfbe2f8d72b2a3ed6.script (rewardingInputs input) 1000)]
