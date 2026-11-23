import CardanoLedgerApi.V3
import LiveScripts.S_b167f9fd68078d24e227c29c23c0d99106412d3e4edd9f83e55c45ed.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b167f9fd68078d24e227c29c23c0d99106412d3e4edd9f83e55c45ed.script (rewardingInputs ctx) 1000)]
