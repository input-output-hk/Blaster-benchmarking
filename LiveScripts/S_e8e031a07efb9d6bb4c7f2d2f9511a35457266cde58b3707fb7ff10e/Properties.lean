import CardanoLedgerApi.V2
import LiveScripts.S_e8e031a07efb9d6bb4c7f2d2f9511a35457266cde58b3707fb7ff10e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e8e031a07efb9d6bb4c7f2d2f9511a35457266cde58b3707fb7ff10e.script (rewardingInputs input) 1000)]
