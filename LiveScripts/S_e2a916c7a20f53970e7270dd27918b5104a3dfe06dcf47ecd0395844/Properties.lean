import CardanoLedgerApi.V3
import LiveScripts.S_e2a916c7a20f53970e7270dd27918b5104a3dfe06dcf47ecd0395844.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e2a916c7a20f53970e7270dd27918b5104a3dfe06dcf47ecd0395844.script (rewardingInputs ctx) 1000)]
