import CardanoLedgerApi.V3
import LiveScripts.S_ed6bdc710fc84219161aab702bb86d7ce4dc9bba19c0881165d980b3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ed6bdc710fc84219161aab702bb86d7ce4dc9bba19c0881165d980b3.script (rewardingInputs ctx) 1000)]
