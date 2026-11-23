import CardanoLedgerApi.V3
import LiveScripts.S_0476b46829b614ea6787a4157b9c8a8c8041c3de5f63d76104d64f51.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0476b46829b614ea6787a4157b9c8a8c8041c3de5f63d76104d64f51.script (mintingInputs ctx) 1000)]
