import CardanoLedgerApi.V3
import LiveScripts.S_8c80ba54ac4c1546bba654777baa3ac50c75276f8ff62e976905a5bd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8c80ba54ac4c1546bba654777baa3ac50c75276f8ff62e976905a5bd.script (rewardingInputs ctx) 1000)]
