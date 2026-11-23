import CardanoLedgerApi.V3
import LiveScripts.S_76b3f5e731783967d7aa9f2c6a2b03fc7e16a4d0c4e29e2dc7ead4ae.Script
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
      ¬ isSuccessful (cekExecuteProgram script_76b3f5e731783967d7aa9f2c6a2b03fc7e16a4d0c4e29e2dc7ead4ae.script (mintingInputs ctx) 1000)]
