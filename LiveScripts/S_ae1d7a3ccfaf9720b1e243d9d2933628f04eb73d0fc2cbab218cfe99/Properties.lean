import CardanoLedgerApi.V3
import LiveScripts.S_ae1d7a3ccfaf9720b1e243d9d2933628f04eb73d0fc2cbab218cfe99.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ae1d7a3ccfaf9720b1e243d9d2933628f04eb73d0fc2cbab218cfe99.script (rewardingInputs ctx) 1000)]
