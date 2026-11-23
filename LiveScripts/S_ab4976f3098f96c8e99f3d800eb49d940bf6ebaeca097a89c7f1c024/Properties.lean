import CardanoLedgerApi.V3
import LiveScripts.S_ab4976f3098f96c8e99f3d800eb49d940bf6ebaeca097a89c7f1c024.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ab4976f3098f96c8e99f3d800eb49d940bf6ebaeca097a89c7f1c024.script (mintingInputs ctx) 1000)]
