import CardanoLedgerApi.V3
import LiveScripts.S_b6f47e52441e75240712320fd152e7bbf8b7aa11c2c3b6f761e0bbe4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b6f47e52441e75240712320fd152e7bbf8b7aa11c2c3b6f761e0bbe4.script (mintingInputs ctx) 1000)]
