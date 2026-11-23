import CardanoLedgerApi.V3
import LiveScripts.S_3aa48fe2f0fbd18f95a1fe97e336857033cc4297f05ae0dad7e0e89a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3aa48fe2f0fbd18f95a1fe97e336857033cc4297f05ae0dad7e0e89a.script (rewardingInputs ctx) 1000)]
