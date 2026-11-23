import CardanoLedgerApi.V3
import LiveScripts.S_95442dc14135b9d0c8a5c79f280bb15bedb8e7512630b9c5db6620e5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_95442dc14135b9d0c8a5c79f280bb15bedb8e7512630b9c5db6620e5.script (rewardingInputs ctx) 1000)]
