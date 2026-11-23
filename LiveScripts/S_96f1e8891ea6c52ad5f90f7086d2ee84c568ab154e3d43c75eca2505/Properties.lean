import CardanoLedgerApi.V3
import LiveScripts.S_96f1e8891ea6c52ad5f90f7086d2ee84c568ab154e3d43c75eca2505.Script
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
      ¬ isSuccessful (cekExecuteProgram script_96f1e8891ea6c52ad5f90f7086d2ee84c568ab154e3d43c75eca2505.script (rewardingInputs ctx) 1000)]
