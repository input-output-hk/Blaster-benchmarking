import CardanoLedgerApi.V3
import LiveScripts.S_ad616fce2529405d9e7b6f7d4cd26e9596f5fe8b4a399b3b06f1cba5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ad616fce2529405d9e7b6f7d4cd26e9596f5fe8b4a399b3b06f1cba5.script (rewardingInputs ctx) 1000)]
