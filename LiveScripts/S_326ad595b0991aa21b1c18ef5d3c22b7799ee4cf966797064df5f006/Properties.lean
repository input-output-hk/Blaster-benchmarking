import CardanoLedgerApi.V2
import LiveScripts.S_326ad595b0991aa21b1c18ef5d3c22b7799ee4cf966797064df5f006.Script
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
      ¬ isSuccessful (cekExecuteProgram script_326ad595b0991aa21b1c18ef5d3c22b7799ee4cf966797064df5f006.script (rewardingInputs input) 1000)]
