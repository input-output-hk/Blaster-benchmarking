import CardanoLedgerApi.V3
import LiveScripts.S_b5690c629c8f6c2df2ca5ea3925151310431a775cc3794155f8ebbbf.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b5690c629c8f6c2df2ca5ea3925151310431a775cc3794155f8ebbbf.script (rewardingInputs ctx) 1000)]
