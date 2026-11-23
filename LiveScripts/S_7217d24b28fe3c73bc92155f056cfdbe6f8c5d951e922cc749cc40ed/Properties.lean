import CardanoLedgerApi.V3
import LiveScripts.S_7217d24b28fe3c73bc92155f056cfdbe6f8c5d951e922cc749cc40ed.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7217d24b28fe3c73bc92155f056cfdbe6f8c5d951e922cc749cc40ed.script (rewardingInputs ctx) 1000)]
