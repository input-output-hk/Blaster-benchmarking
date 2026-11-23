import CardanoLedgerApi.V3
import LiveScripts.S_1bcd2ac824b02aac21c4a018138aca4884c99fb3b9bca64d6240af2e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1bcd2ac824b02aac21c4a018138aca4884c99fb3b9bca64d6240af2e.script (rewardingInputs ctx) 1000)]
