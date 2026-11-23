import CardanoLedgerApi.V3
import LiveScripts.S_d8436919ee35d79ff7ed2173fca54c88aef1105323e8fd69c1b108c1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d8436919ee35d79ff7ed2173fca54c88aef1105323e8fd69c1b108c1.script (rewardingInputs ctx) 1000)]
