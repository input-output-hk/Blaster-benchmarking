import CardanoLedgerApi.V3
import LiveScripts.S_b0edcb043430366cdcb09d4d4c9463369dc3e704a00e41beb272d9d9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b0edcb043430366cdcb09d4d4c9463369dc3e704a00e41beb272d9d9.script (rewardingInputs ctx) 1000)]
