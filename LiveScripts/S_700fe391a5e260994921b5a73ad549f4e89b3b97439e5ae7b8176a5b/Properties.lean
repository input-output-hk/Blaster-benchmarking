import CardanoLedgerApi.V3
import LiveScripts.S_700fe391a5e260994921b5a73ad549f4e89b3b97439e5ae7b8176a5b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_700fe391a5e260994921b5a73ad549f4e89b3b97439e5ae7b8176a5b.script (rewardingInputs ctx) 1000)]
