import CardanoLedgerApi.V3
import LiveScripts.S_bd38fbe12fed3bad158f6b4b52f5f3bdcb559bcb7668f6eded474b7e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bd38fbe12fed3bad158f6b4b52f5f3bdcb559bcb7668f6eded474b7e.script (rewardingInputs ctx) 1000)]
