import CardanoLedgerApi.V3
import LiveScripts.S_320ab87a9d22c74ad3e665c35e9509e6d055c8660143dc209cd05c30.Script
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
      ¬ isSuccessful (cekExecuteProgram script_320ab87a9d22c74ad3e665c35e9509e6d055c8660143dc209cd05c30.script (rewardingInputs ctx) 1000)]
