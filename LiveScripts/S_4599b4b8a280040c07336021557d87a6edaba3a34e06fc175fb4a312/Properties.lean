import CardanoLedgerApi.V3
import LiveScripts.S_4599b4b8a280040c07336021557d87a6edaba3a34e06fc175fb4a312.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4599b4b8a280040c07336021557d87a6edaba3a34e06fc175fb4a312.script (rewardingInputs ctx) 1000)]
