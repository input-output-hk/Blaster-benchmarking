import CardanoLedgerApi.V3
import LiveScripts.S_6d4c3774fb9efb420e41ed62a3445b65e68ef1f51432e030de44eb7a.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validMintingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_6d4c3774fb9efb420e41ed62a3445b65e68ef1f51432e030de44eb7a.script (mintingInputs ctx) 1000)]
