import CardanoLedgerApi.V2
import LiveScripts.S_78a1ec37d8072b8ff92ca591ca362be083df4001f10f81a5e73f5dad.Script
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
      ¬ isSuccessful (cekExecuteProgram script_78a1ec37d8072b8ff92ca591ca362be083df4001f10f81a5e73f5dad.script (rewardingInputs input) 1000)]
