import CardanoLedgerApi.V3
import LiveScripts.S_b6e24f8aa2f1b7537940252e34a243ff3f7c5ba2168126afe451a83a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b6e24f8aa2f1b7537940252e34a243ff3f7c5ba2168126afe451a83a.script (rewardingInputs ctx) 1000)]
