import CardanoLedgerApi.V2
import LiveScripts.S_73acd7d0c1e33bc44a07a7379f9a5f9b5255f06fce95dbf9e9b29b17.Script
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
      ¬ isSuccessful (cekExecuteProgram script_73acd7d0c1e33bc44a07a7379f9a5f9b5255f06fce95dbf9e9b29b17.script (rewardingInputs input) 1000)]
