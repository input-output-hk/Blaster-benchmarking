import CardanoLedgerApi.V3
import LiveScripts.S_99d2cd737b4e56c4bef1da11f9a5e15c8885c88844749dc3b9023110.Script
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
      ¬ isSuccessful (cekExecuteProgram script_99d2cd737b4e56c4bef1da11f9a5e15c8885c88844749dc3b9023110.script (rewardingInputs ctx) 1000)]
