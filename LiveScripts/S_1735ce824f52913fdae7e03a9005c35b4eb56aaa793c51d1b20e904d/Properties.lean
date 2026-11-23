import CardanoLedgerApi.V3
import LiveScripts.S_1735ce824f52913fdae7e03a9005c35b4eb56aaa793c51d1b20e904d.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: reward; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validRewardingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_1735ce824f52913fdae7e03a9005c35b4eb56aaa793c51d1b20e904d.script (rewardingInputs ctx) 1000)]
