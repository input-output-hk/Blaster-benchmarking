import CardanoLedgerApi.V2
import LiveScripts.S_e2c9456b74f63d4ec4c64bb2bca3e2a09d9afdb72ddc60c76aa045cf.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e2c9456b74f63d4ec4c64bb2bca3e2a09d9afdb72ddc60c76aa045cf.script (rewardingInputs input) 1000)]
