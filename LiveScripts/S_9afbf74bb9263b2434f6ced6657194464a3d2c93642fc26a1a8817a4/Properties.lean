import CardanoLedgerApi.V2
import LiveScripts.S_9afbf74bb9263b2434f6ced6657194464a3d2c93642fc26a1a8817a4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9afbf74bb9263b2434f6ced6657194464a3d2c93642fc26a1a8817a4.script (rewardingInputs input) 1000)]
