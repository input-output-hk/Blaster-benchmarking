import CardanoLedgerApi.V3
import LiveScripts.S_faf0f10d082403d39582b7fa25d76501dfc621ceb2a1eb795cf5970b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_faf0f10d082403d39582b7fa25d76501dfc621ceb2a1eb795cf5970b.script (mintingInputs ctx) 1000)]
