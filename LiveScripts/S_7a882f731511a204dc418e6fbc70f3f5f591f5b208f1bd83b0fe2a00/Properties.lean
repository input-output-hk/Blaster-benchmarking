import CardanoLedgerApi.V3
import LiveScripts.S_7a882f731511a204dc418e6fbc70f3f5f591f5b208f1bd83b0fe2a00.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7a882f731511a204dc418e6fbc70f3f5f591f5b208f1bd83b0fe2a00.script (mintingInputs ctx) 1000)]
