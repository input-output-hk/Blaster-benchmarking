import CardanoLedgerApi.V3
import LiveScripts.S_3d9d76c894b7e33373c668b2a10dea82fb5fa7cc63164d9505eea234.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3d9d76c894b7e33373c668b2a10dea82fb5fa7cc63164d9505eea234.script (rewardingInputs ctx) 1000)]
