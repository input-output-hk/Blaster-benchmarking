import CardanoLedgerApi.V3
import LiveScripts.S_6fb003585fcdf63810bb9c2a117b71cf61772bebaa31040f84d02928.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6fb003585fcdf63810bb9c2a117b71cf61772bebaa31040f84d02928.script (rewardingInputs ctx) 1000)]
