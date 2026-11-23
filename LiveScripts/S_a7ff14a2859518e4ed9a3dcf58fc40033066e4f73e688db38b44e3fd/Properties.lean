import CardanoLedgerApi.V3
import LiveScripts.S_a7ff14a2859518e4ed9a3dcf58fc40033066e4f73e688db38b44e3fd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a7ff14a2859518e4ed9a3dcf58fc40033066e4f73e688db38b44e3fd.script (rewardingInputs ctx) 1000)]
