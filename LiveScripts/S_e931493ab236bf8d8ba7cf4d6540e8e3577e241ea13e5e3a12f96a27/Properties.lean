import CardanoLedgerApi.V3
import LiveScripts.S_e931493ab236bf8d8ba7cf4d6540e8e3577e241ea13e5e3a12f96a27.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e931493ab236bf8d8ba7cf4d6540e8e3577e241ea13e5e3a12f96a27.script (rewardingInputs ctx) 1000)]
