import CardanoLedgerApi.V3
import LiveScripts.S_9ee8aa0eaa65dbe04e96c4a9ef64b178113c647fe785ff6b4da3b837.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9ee8aa0eaa65dbe04e96c4a9ef64b178113c647fe785ff6b4da3b837.script (mintingInputs ctx) 1000)]
