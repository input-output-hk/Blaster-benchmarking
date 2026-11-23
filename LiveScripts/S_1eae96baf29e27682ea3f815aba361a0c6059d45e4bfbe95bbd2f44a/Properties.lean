import CardanoLedgerApi.V2
import LiveScripts.S_1eae96baf29e27682ea3f815aba361a0c6059d45e4bfbe95bbd2f44a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1eae96baf29e27682ea3f815aba361a0c6059d45e4bfbe95bbd2f44a.script (rewardingInputs input) 1000)]
