import CardanoLedgerApi.V3
import LiveScripts.S_8d452b4a3b640f2be639b05a8a0a0e32ac6cb89de0ae7d00e26ea292.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8d452b4a3b640f2be639b05a8a0a0e32ac6cb89de0ae7d00e26ea292.script (mintingInputs ctx) 1000)]
