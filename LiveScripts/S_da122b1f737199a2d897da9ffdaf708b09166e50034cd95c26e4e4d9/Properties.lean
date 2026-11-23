import CardanoLedgerApi.V3
import LiveScripts.S_da122b1f737199a2d897da9ffdaf708b09166e50034cd95c26e4e4d9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_da122b1f737199a2d897da9ffdaf708b09166e50034cd95c26e4e4d9.script (rewardingInputs ctx) 1000)]
