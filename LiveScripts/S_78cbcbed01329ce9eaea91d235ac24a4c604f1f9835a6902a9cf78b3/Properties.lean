import CardanoLedgerApi.V3
import LiveScripts.S_78cbcbed01329ce9eaea91d235ac24a4c604f1f9835a6902a9cf78b3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_78cbcbed01329ce9eaea91d235ac24a4c604f1f9835a6902a9cf78b3.script (rewardingInputs ctx) 1000)]
