import CardanoLedgerApi.V2
import LiveScripts.S_0928984ed4ce5b6cd17094544a5b9e33f7e4c0169948624dd4fb29f2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0928984ed4ce5b6cd17094544a5b9e33f7e4c0169948624dd4fb29f2.script (rewardingInputs input) 1000)]
