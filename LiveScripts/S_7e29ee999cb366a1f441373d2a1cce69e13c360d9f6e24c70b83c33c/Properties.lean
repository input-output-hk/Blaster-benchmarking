import CardanoLedgerApi.V3
import LiveScripts.S_7e29ee999cb366a1f441373d2a1cce69e13c360d9f6e24c70b83c33c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7e29ee999cb366a1f441373d2a1cce69e13c360d9f6e24c70b83c33c.script (mintingInputs ctx) 1000)]
