import CardanoLedgerApi.V3
import LiveScripts.S_0752d1a38bf34de7d503407b47080fa22ad01ad5c44ec5d18d1e1a32.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0752d1a38bf34de7d503407b47080fa22ad01ad5c44ec5d18d1e1a32.script (rewardingInputs ctx) 1000)]
