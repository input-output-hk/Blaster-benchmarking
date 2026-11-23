import CardanoLedgerApi.V3
import LiveScripts.S_186843b12bb63d7f3d8015f6e418d7cb9a55a029a564bb44167886e3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_186843b12bb63d7f3d8015f6e418d7cb9a55a029a564bb44167886e3.script (rewardingInputs ctx) 1000)]
