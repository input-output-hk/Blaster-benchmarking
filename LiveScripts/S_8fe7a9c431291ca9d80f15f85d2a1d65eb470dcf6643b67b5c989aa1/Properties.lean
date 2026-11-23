import CardanoLedgerApi.V3
import LiveScripts.S_8fe7a9c431291ca9d80f15f85d2a1d65eb470dcf6643b67b5c989aa1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8fe7a9c431291ca9d80f15f85d2a1d65eb470dcf6643b67b5c989aa1.script (rewardingInputs ctx) 1000)]
