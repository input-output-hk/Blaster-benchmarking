import CardanoLedgerApi.V3
import LiveScripts.S_9da7071e0abb11aa4e1b669ae60592d3dbcaade6e9724c45b1a654eb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9da7071e0abb11aa4e1b669ae60592d3dbcaade6e9724c45b1a654eb.script (rewardingInputs ctx) 1000)]
