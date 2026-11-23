import CardanoLedgerApi.V3
import LiveScripts.S_3a561e401144af4f5dfeeb28ad7fe16b33e656ad5099a93e434928a4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3a561e401144af4f5dfeeb28ad7fe16b33e656ad5099a93e434928a4.script (rewardingInputs ctx) 1000)]
