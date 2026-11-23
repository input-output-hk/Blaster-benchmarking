import CardanoLedgerApi.V2
import LiveScripts.S_0e45793d2233f3efb19ee4c5fafac7eedc3e7f11639300b52cd1402f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0e45793d2233f3efb19ee4c5fafac7eedc3e7f11639300b52cd1402f.script (rewardingInputs input) 1000)]
