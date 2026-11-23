import CardanoLedgerApi.V3
import LiveScripts.S_d75e8fbb38a55b68ea1c27e07c91d9af3c3e87dbdef4e3e1eb2844bb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d75e8fbb38a55b68ea1c27e07c91d9af3c3e87dbdef4e3e1eb2844bb.script (rewardingInputs ctx) 1000)]
