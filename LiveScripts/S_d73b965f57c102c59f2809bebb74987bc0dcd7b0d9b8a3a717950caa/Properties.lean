import CardanoLedgerApi.V3
import LiveScripts.S_d73b965f57c102c59f2809bebb74987bc0dcd7b0d9b8a3a717950caa.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d73b965f57c102c59f2809bebb74987bc0dcd7b0d9b8a3a717950caa.script (rewardingInputs ctx) 1000)]
