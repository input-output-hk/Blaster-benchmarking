import CardanoLedgerApi.V3
import LiveScripts.S_23b58b985141fe5ffd2eb93c5ee4fa0e11d46a934c2837c0230071fd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_23b58b985141fe5ffd2eb93c5ee4fa0e11d46a934c2837c0230071fd.script (rewardingInputs ctx) 1000)]
