import CardanoLedgerApi.V3
import LiveScripts.S_2f7788930df1dc79d64318527ccffa532c7a643e5a2b71ab5d2355b3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2f7788930df1dc79d64318527ccffa532c7a643e5a2b71ab5d2355b3.script (rewardingInputs ctx) 1000)]
