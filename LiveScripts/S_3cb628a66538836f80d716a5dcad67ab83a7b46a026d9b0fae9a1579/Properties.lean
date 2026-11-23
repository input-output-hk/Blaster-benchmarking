import CardanoLedgerApi.V3
import LiveScripts.S_3cb628a66538836f80d716a5dcad67ab83a7b46a026d9b0fae9a1579.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3cb628a66538836f80d716a5dcad67ab83a7b46a026d9b0fae9a1579.script (rewardingInputs ctx) 1000)]
