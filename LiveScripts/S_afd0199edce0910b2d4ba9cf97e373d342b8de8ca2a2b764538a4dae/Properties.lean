import CardanoLedgerApi.V2
import LiveScripts.S_afd0199edce0910b2d4ba9cf97e373d342b8de8ca2a2b764538a4dae.Script
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
      ¬ isSuccessful (cekExecuteProgram script_afd0199edce0910b2d4ba9cf97e373d342b8de8ca2a2b764538a4dae.script (rewardingInputs input) 1000)]
