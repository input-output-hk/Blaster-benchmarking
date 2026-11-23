import CardanoLedgerApi.V3
import LiveScripts.S_56661cf4ade72946ede31a3f406950dcd4b6864310e3f2a2dec9e1dd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_56661cf4ade72946ede31a3f406950dcd4b6864310e3f2a2dec9e1dd.script (rewardingInputs ctx) 1000)]
