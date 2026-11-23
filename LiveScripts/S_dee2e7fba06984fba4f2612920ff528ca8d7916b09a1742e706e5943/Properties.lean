import CardanoLedgerApi.V3
import LiveScripts.S_dee2e7fba06984fba4f2612920ff528ca8d7916b09a1742e706e5943.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dee2e7fba06984fba4f2612920ff528ca8d7916b09a1742e706e5943.script (rewardingInputs ctx) 1000)]
