import CardanoLedgerApi.V3
import LiveScripts.S_7f63204aaf8fa3fd5428e472ad8c47215af49396b9af9f56799320e3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7f63204aaf8fa3fd5428e472ad8c47215af49396b9af9f56799320e3.script (rewardingInputs ctx) 1000)]
