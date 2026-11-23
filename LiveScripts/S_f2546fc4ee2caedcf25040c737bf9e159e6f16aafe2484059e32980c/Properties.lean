import CardanoLedgerApi.V3
import LiveScripts.S_f2546fc4ee2caedcf25040c737bf9e159e6f16aafe2484059e32980c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f2546fc4ee2caedcf25040c737bf9e159e6f16aafe2484059e32980c.script (rewardingInputs ctx) 1000)]
