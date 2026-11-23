import CardanoLedgerApi.V3
import LiveScripts.S_075b0ce5d592d51262e6d3e1c8a88e94c86470f95dc7b8e7a9139782.Script
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
      ¬ isSuccessful (cekExecuteProgram script_075b0ce5d592d51262e6d3e1c8a88e94c86470f95dc7b8e7a9139782.script (rewardingInputs ctx) 1000)]
