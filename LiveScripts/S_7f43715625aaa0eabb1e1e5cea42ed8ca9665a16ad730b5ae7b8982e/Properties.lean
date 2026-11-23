import CardanoLedgerApi.V3
import LiveScripts.S_7f43715625aaa0eabb1e1e5cea42ed8ca9665a16ad730b5ae7b8982e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7f43715625aaa0eabb1e1e5cea42ed8ca9665a16ad730b5ae7b8982e.script (mintingInputs ctx) 1000)]
