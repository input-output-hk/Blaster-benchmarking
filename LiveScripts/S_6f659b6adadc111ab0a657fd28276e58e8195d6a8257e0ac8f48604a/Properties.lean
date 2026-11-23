import CardanoLedgerApi.V3
import LiveScripts.S_6f659b6adadc111ab0a657fd28276e58e8195d6a8257e0ac8f48604a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6f659b6adadc111ab0a657fd28276e58e8195d6a8257e0ac8f48604a.script (mintingInputs ctx) 1000)]
