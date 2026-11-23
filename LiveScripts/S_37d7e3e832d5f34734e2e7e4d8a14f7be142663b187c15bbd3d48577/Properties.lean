import CardanoLedgerApi.V3
import LiveScripts.S_37d7e3e832d5f34734e2e7e4d8a14f7be142663b187c15bbd3d48577.Script
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
      ¬ isSuccessful (cekExecuteProgram script_37d7e3e832d5f34734e2e7e4d8a14f7be142663b187c15bbd3d48577.script (rewardingInputs ctx) 1000)]
