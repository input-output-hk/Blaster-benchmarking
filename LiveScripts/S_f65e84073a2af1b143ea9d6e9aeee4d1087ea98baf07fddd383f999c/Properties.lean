import CardanoLedgerApi.V3
import LiveScripts.S_f65e84073a2af1b143ea9d6e9aeee4d1087ea98baf07fddd383f999c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f65e84073a2af1b143ea9d6e9aeee4d1087ea98baf07fddd383f999c.script (rewardingInputs ctx) 1000)]
