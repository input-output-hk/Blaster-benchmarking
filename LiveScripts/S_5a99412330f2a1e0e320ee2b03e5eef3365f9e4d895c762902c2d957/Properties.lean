import CardanoLedgerApi.V3
import LiveScripts.S_5a99412330f2a1e0e320ee2b03e5eef3365f9e4d895c762902c2d957.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5a99412330f2a1e0e320ee2b03e5eef3365f9e4d895c762902c2d957.script (mintingInputs ctx) 1000)]
