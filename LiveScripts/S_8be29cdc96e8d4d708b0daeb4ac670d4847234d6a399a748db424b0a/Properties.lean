import CardanoLedgerApi.V3
import LiveScripts.S_8be29cdc96e8d4d708b0daeb4ac670d4847234d6a399a748db424b0a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8be29cdc96e8d4d708b0daeb4ac670d4847234d6a399a748db424b0a.script (rewardingInputs ctx) 1000)]
