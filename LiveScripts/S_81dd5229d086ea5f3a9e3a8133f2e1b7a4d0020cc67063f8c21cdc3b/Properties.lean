import CardanoLedgerApi.V3
import LiveScripts.S_81dd5229d086ea5f3a9e3a8133f2e1b7a4d0020cc67063f8c21cdc3b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_81dd5229d086ea5f3a9e3a8133f2e1b7a4d0020cc67063f8c21cdc3b.script (rewardingInputs ctx) 1000)]
