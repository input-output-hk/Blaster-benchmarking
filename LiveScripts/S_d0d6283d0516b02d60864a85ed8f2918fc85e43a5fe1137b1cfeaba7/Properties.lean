import CardanoLedgerApi.V3
import LiveScripts.S_d0d6283d0516b02d60864a85ed8f2918fc85e43a5fe1137b1cfeaba7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d0d6283d0516b02d60864a85ed8f2918fc85e43a5fe1137b1cfeaba7.script (rewardingInputs ctx) 1000)]
