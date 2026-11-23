import CardanoLedgerApi.V2
import LiveScripts.S_902042871cd5ad69074da4f1d1f1fb93823340ff1a363a5275eb1d8b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_902042871cd5ad69074da4f1d1f1fb93823340ff1a363a5275eb1d8b.script (rewardingInputs input) 1000)]
