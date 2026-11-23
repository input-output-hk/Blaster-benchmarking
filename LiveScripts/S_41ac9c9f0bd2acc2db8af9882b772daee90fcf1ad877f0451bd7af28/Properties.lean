import CardanoLedgerApi.V3
import LiveScripts.S_41ac9c9f0bd2acc2db8af9882b772daee90fcf1ad877f0451bd7af28.Script
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
      ¬ isSuccessful (cekExecuteProgram script_41ac9c9f0bd2acc2db8af9882b772daee90fcf1ad877f0451bd7af28.script (rewardingInputs ctx) 1000)]
