import CardanoLedgerApi.V2
import LiveScripts.S_ea5c6035bcfd83a92c04eff0008b6fd02efac6a20e0abdaebaee2808.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ea5c6035bcfd83a92c04eff0008b6fd02efac6a20e0abdaebaee2808.script (rewardingInputs input) 1000)]
