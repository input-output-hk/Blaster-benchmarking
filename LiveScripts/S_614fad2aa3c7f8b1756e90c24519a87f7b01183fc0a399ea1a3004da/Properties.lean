import CardanoLedgerApi.V2
import LiveScripts.S_614fad2aa3c7f8b1756e90c24519a87f7b01183fc0a399ea1a3004da.Script
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
      ¬ isSuccessful (cekExecuteProgram script_614fad2aa3c7f8b1756e90c24519a87f7b01183fc0a399ea1a3004da.script (rewardingInputs input) 1000)]
