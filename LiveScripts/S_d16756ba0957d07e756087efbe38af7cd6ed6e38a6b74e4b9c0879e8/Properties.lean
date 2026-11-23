import CardanoLedgerApi.V2
import LiveScripts.S_d16756ba0957d07e756087efbe38af7cd6ed6e38a6b74e4b9c0879e8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d16756ba0957d07e756087efbe38af7cd6ed6e38a6b74e4b9c0879e8.script (rewardingInputs input) 1000)]
