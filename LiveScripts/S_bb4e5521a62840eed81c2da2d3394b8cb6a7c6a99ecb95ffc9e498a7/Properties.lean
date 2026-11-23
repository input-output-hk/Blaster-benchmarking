import CardanoLedgerApi.V3
import LiveScripts.S_bb4e5521a62840eed81c2da2d3394b8cb6a7c6a99ecb95ffc9e498a7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bb4e5521a62840eed81c2da2d3394b8cb6a7c6a99ecb95ffc9e498a7.script (rewardingInputs ctx) 1000)]
