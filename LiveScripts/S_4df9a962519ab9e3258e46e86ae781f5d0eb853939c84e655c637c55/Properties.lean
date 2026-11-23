import CardanoLedgerApi.V2
import LiveScripts.S_4df9a962519ab9e3258e46e86ae781f5d0eb853939c84e655c637c55.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4df9a962519ab9e3258e46e86ae781f5d0eb853939c84e655c637c55.script (rewardingInputs input) 1000)]
