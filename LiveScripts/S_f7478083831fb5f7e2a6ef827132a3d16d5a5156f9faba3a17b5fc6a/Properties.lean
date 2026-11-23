import CardanoLedgerApi.V3
import LiveScripts.S_f7478083831fb5f7e2a6ef827132a3d16d5a5156f9faba3a17b5fc6a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f7478083831fb5f7e2a6ef827132a3d16d5a5156f9faba3a17b5fc6a.script (rewardingInputs ctx) 1000)]
