import CardanoLedgerApi.V3
import LiveScripts.S_c04be0225bbaf3d3722a6d1472244335c982b06c7f9bae3121ecb979.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c04be0225bbaf3d3722a6d1472244335c982b06c7f9bae3121ecb979.script (rewardingInputs ctx) 1000)]
