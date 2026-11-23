import CardanoLedgerApi.V3
import LiveScripts.S_88e9c4597bb60aa4258ecd1c709812c7b7344425141e4150b35f9c57.Script
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
      ¬ isSuccessful (cekExecuteProgram script_88e9c4597bb60aa4258ecd1c709812c7b7344425141e4150b35f9c57.script (rewardingInputs ctx) 1000)]
