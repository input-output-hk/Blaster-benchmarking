import CardanoLedgerApi.V3
import LiveScripts.S_aabe597d93e4c025f33b6f4ef46ecf42ae38f0696fb2e98a8c362252.Script
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
      ¬ isSuccessful (cekExecuteProgram script_aabe597d93e4c025f33b6f4ef46ecf42ae38f0696fb2e98a8c362252.script (rewardingInputs ctx) 1000)]
