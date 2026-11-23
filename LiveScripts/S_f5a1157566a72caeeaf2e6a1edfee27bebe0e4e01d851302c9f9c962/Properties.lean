import CardanoLedgerApi.V2
import LiveScripts.S_f5a1157566a72caeeaf2e6a1edfee27bebe0e4e01d851302c9f9c962.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f5a1157566a72caeeaf2e6a1edfee27bebe0e4e01d851302c9f9c962.script (rewardingInputs input) 1000)]
