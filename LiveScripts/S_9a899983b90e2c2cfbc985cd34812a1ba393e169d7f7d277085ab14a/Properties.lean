import CardanoLedgerApi.V3
import LiveScripts.S_9a899983b90e2c2cfbc985cd34812a1ba393e169d7f7d277085ab14a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9a899983b90e2c2cfbc985cd34812a1ba393e169d7f7d277085ab14a.script (rewardingInputs ctx) 1000)]
