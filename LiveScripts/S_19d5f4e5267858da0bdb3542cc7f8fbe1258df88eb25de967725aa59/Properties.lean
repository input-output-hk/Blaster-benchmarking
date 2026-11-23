import CardanoLedgerApi.V3
import LiveScripts.S_19d5f4e5267858da0bdb3542cc7f8fbe1258df88eb25de967725aa59.Script
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
      ¬ isSuccessful (cekExecuteProgram script_19d5f4e5267858da0bdb3542cc7f8fbe1258df88eb25de967725aa59.script (rewardingInputs ctx) 1000)]
