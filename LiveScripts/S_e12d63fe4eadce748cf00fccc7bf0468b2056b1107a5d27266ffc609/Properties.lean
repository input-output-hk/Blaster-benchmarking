import CardanoLedgerApi.V3
import LiveScripts.S_e12d63fe4eadce748cf00fccc7bf0468b2056b1107a5d27266ffc609.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e12d63fe4eadce748cf00fccc7bf0468b2056b1107a5d27266ffc609.script (rewardingInputs ctx) 1000)]
