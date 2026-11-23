import CardanoLedgerApi.V3
import LiveScripts.S_874a3bf145a070e927cdbac7823c8c7e08a96aee5a5e4a8a7633bdf4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_874a3bf145a070e927cdbac7823c8c7e08a96aee5a5e4a8a7633bdf4.script (rewardingInputs ctx) 1000)]
