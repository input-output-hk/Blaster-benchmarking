import CardanoLedgerApi.V3
import LiveScripts.S_1c258fc7dc88ff02fb5e19b01a58693e61a3778c2305ba59a8c8e5f3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1c258fc7dc88ff02fb5e19b01a58693e61a3778c2305ba59a8c8e5f3.script (rewardingInputs ctx) 1000)]
