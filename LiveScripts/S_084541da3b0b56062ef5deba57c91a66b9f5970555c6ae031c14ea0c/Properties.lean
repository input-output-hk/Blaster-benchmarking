import CardanoLedgerApi.V3
import LiveScripts.S_084541da3b0b56062ef5deba57c91a66b9f5970555c6ae031c14ea0c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_084541da3b0b56062ef5deba57c91a66b9f5970555c6ae031c14ea0c.script (rewardingInputs ctx) 1000)]
