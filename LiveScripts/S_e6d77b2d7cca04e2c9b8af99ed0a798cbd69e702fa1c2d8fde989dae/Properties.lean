import CardanoLedgerApi.V3
import LiveScripts.S_e6d77b2d7cca04e2c9b8af99ed0a798cbd69e702fa1c2d8fde989dae.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e6d77b2d7cca04e2c9b8af99ed0a798cbd69e702fa1c2d8fde989dae.script (rewardingInputs ctx) 1000)]
