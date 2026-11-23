import CardanoLedgerApi.V3
import LiveScripts.S_9f3f100f759e31cf55d20f04bf7d8baf024bccdecaa53a4e3d6ce1d5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9f3f100f759e31cf55d20f04bf7d8baf024bccdecaa53a4e3d6ce1d5.script (rewardingInputs ctx) 1000)]
