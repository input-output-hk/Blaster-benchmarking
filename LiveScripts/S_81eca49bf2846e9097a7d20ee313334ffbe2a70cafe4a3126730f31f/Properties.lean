import CardanoLedgerApi.V3
import LiveScripts.S_81eca49bf2846e9097a7d20ee313334ffbe2a70cafe4a3126730f31f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_81eca49bf2846e9097a7d20ee313334ffbe2a70cafe4a3126730f31f.script (rewardingInputs ctx) 1000)]
