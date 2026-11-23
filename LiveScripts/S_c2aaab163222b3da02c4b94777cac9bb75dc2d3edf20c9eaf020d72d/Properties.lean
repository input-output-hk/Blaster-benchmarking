import CardanoLedgerApi.V2
import LiveScripts.S_c2aaab163222b3da02c4b94777cac9bb75dc2d3edf20c9eaf020d72d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c2aaab163222b3da02c4b94777cac9bb75dc2d3edf20c9eaf020d72d.script (rewardingInputs input) 1000)]
