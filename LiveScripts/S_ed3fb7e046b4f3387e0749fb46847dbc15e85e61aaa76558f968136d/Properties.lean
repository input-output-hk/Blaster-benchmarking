import CardanoLedgerApi.V3
import LiveScripts.S_ed3fb7e046b4f3387e0749fb46847dbc15e85e61aaa76558f968136d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ed3fb7e046b4f3387e0749fb46847dbc15e85e61aaa76558f968136d.script (rewardingInputs ctx) 1000)]
