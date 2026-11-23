import CardanoLedgerApi.V3
import LiveScripts.S_2a51bbab3bd53dcde2245950a77637f03588df6b4a8880b0ec907a7e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2a51bbab3bd53dcde2245950a77637f03588df6b4a8880b0ec907a7e.script (rewardingInputs ctx) 1000)]
