import CardanoLedgerApi.V3
import LiveScripts.S_fbde7dd06f85b1e5c893d12ffad21f01ce09e1cce3aa4e113e94b2d0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fbde7dd06f85b1e5c893d12ffad21f01ce09e1cce3aa4e113e94b2d0.script (rewardingInputs ctx) 1000)]
