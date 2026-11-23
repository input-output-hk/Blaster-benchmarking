import CardanoLedgerApi.V3
import LiveScripts.S_0091aad5d3ded01e6c52d6b3b43c02af72104d38d78c72bd280d3190.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0091aad5d3ded01e6c52d6b3b43c02af72104d38d78c72bd280d3190.script (rewardingInputs ctx) 1000)]
