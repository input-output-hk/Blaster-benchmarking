import CardanoLedgerApi.V2
import LiveScripts.S_7845f8733855e17eb57ceec769581c4cdb8b78ae4e58753c0fb7ef0a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7845f8733855e17eb57ceec769581c4cdb8b78ae4e58753c0fb7ef0a.script (rewardingInputs input) 1000)]
