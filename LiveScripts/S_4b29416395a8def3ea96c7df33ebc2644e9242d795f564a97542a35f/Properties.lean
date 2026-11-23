import CardanoLedgerApi.V2
import LiveScripts.S_4b29416395a8def3ea96c7df33ebc2644e9242d795f564a97542a35f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4b29416395a8def3ea96c7df33ebc2644e9242d795f564a97542a35f.script (rewardingInputs input) 1000)]
