import CardanoLedgerApi.V2
import LiveScripts.S_d1d7d452a41ef27856824cd9cc8ff04ee543192474e06e8d89445144.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d1d7d452a41ef27856824cd9cc8ff04ee543192474e06e8d89445144.script (rewardingInputs input) 1000)]
