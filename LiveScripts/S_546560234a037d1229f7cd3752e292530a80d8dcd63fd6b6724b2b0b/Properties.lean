import CardanoLedgerApi.V3
import LiveScripts.S_546560234a037d1229f7cd3752e292530a80d8dcd63fd6b6724b2b0b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_546560234a037d1229f7cd3752e292530a80d8dcd63fd6b6724b2b0b.script (rewardingInputs ctx) 1000)]
