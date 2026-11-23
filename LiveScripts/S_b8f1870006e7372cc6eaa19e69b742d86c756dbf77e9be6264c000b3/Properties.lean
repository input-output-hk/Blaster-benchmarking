import CardanoLedgerApi.V3
import LiveScripts.S_b8f1870006e7372cc6eaa19e69b742d86c756dbf77e9be6264c000b3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b8f1870006e7372cc6eaa19e69b742d86c756dbf77e9be6264c000b3.script (rewardingInputs ctx) 1000)]
