import CardanoLedgerApi.V3
import LiveScripts.S_cb4795b8c101099e2bd0f8923c6f10f618ab1f2b552b8c18ffb25416.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cb4795b8c101099e2bd0f8923c6f10f618ab1f2b552b8c18ffb25416.script (rewardingInputs ctx) 1000)]
