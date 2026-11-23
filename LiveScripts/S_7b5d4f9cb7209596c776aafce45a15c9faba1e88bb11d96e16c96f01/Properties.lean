import CardanoLedgerApi.V3
import LiveScripts.S_7b5d4f9cb7209596c776aafce45a15c9faba1e88bb11d96e16c96f01.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7b5d4f9cb7209596c776aafce45a15c9faba1e88bb11d96e16c96f01.script (rewardingInputs ctx) 1000)]
