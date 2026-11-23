import CardanoLedgerApi.V2
import LiveScripts.S_1206aaaf9d1d296cfc2642fe67e310112d7f83e366e1ed80c22a5438.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1206aaaf9d1d296cfc2642fe67e310112d7f83e366e1ed80c22a5438.script (rewardingInputs input) 1000)]
