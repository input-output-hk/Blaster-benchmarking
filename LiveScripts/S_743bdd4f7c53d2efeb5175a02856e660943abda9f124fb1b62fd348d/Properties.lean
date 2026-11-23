import CardanoLedgerApi.V3
import LiveScripts.S_743bdd4f7c53d2efeb5175a02856e660943abda9f124fb1b62fd348d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_743bdd4f7c53d2efeb5175a02856e660943abda9f124fb1b62fd348d.script (rewardingInputs ctx) 1000)]
