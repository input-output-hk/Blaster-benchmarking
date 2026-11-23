import CardanoLedgerApi.V2
import LiveScripts.S_491c30ed4defe0940955177b84195e5f3f9a7f559ed377b4346cfd71.Script
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
      ¬ isSuccessful (cekExecuteProgram script_491c30ed4defe0940955177b84195e5f3f9a7f559ed377b4346cfd71.script (rewardingInputs input) 1000)]
