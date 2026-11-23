import CardanoLedgerApi.V3
import LiveScripts.S_76ef134e5177925e13e63d2d4938fdd8b7bf0d13b2ddbfeb4d584232.Script
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
      ¬ isSuccessful (cekExecuteProgram script_76ef134e5177925e13e63d2d4938fdd8b7bf0d13b2ddbfeb4d584232.script (rewardingInputs ctx) 1000)]
