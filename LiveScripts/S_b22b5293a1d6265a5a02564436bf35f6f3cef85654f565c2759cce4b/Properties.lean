import CardanoLedgerApi.V3
import LiveScripts.S_b22b5293a1d6265a5a02564436bf35f6f3cef85654f565c2759cce4b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b22b5293a1d6265a5a02564436bf35f6f3cef85654f565c2759cce4b.script (rewardingInputs ctx) 1000)]
