import CardanoLedgerApi.V3
import LiveScripts.S_e7d97fde3e0a49a16eb8bae7e21dc7e9709bd85574d801089125aae6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e7d97fde3e0a49a16eb8bae7e21dc7e9709bd85574d801089125aae6.script (rewardingInputs ctx) 1000)]
