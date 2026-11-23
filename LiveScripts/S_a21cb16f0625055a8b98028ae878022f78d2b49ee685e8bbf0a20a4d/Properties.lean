import CardanoLedgerApi.V3
import LiveScripts.S_a21cb16f0625055a8b98028ae878022f78d2b49ee685e8bbf0a20a4d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a21cb16f0625055a8b98028ae878022f78d2b49ee685e8bbf0a20a4d.script (rewardingInputs ctx) 1000)]
