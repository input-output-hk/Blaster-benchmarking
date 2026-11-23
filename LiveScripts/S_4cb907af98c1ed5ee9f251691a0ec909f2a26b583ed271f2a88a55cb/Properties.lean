import CardanoLedgerApi.V3
import LiveScripts.S_4cb907af98c1ed5ee9f251691a0ec909f2a26b583ed271f2a88a55cb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4cb907af98c1ed5ee9f251691a0ec909f2a26b583ed271f2a88a55cb.script (rewardingInputs ctx) 1000)]
