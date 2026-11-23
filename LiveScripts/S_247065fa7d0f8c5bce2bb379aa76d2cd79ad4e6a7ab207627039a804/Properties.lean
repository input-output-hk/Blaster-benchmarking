import CardanoLedgerApi.V3
import LiveScripts.S_247065fa7d0f8c5bce2bb379aa76d2cd79ad4e6a7ab207627039a804.Script
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
      ¬ isSuccessful (cekExecuteProgram script_247065fa7d0f8c5bce2bb379aa76d2cd79ad4e6a7ab207627039a804.script (rewardingInputs ctx) 1000)]
