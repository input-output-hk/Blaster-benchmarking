import CardanoLedgerApi.V3
import LiveScripts.S_09c983f78f4b51df76cfd41936906d898d66fc90a782b51e9a12b0f1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_09c983f78f4b51df76cfd41936906d898d66fc90a782b51e9a12b0f1.script (rewardingInputs ctx) 1000)]
