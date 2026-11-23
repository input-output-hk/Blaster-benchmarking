import CardanoLedgerApi.V3
import LiveScripts.S_30f1fac08a15ef84ea6a5aa04989b1c2ceeb3b437f2c3103df5aca68.Script
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
      ¬ isSuccessful (cekExecuteProgram script_30f1fac08a15ef84ea6a5aa04989b1c2ceeb3b437f2c3103df5aca68.script (rewardingInputs ctx) 1000)]
