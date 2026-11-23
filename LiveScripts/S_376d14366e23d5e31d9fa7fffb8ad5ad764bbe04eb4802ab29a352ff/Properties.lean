import CardanoLedgerApi.V3
import LiveScripts.S_376d14366e23d5e31d9fa7fffb8ad5ad764bbe04eb4802ab29a352ff.Script
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
      ¬ isSuccessful (cekExecuteProgram script_376d14366e23d5e31d9fa7fffb8ad5ad764bbe04eb4802ab29a352ff.script (rewardingInputs ctx) 1000)]
