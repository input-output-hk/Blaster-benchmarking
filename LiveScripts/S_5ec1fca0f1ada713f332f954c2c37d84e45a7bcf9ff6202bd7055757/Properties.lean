import CardanoLedgerApi.V3
import LiveScripts.S_5ec1fca0f1ada713f332f954c2c37d84e45a7bcf9ff6202bd7055757.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5ec1fca0f1ada713f332f954c2c37d84e45a7bcf9ff6202bd7055757.script (rewardingInputs ctx) 1000)]
