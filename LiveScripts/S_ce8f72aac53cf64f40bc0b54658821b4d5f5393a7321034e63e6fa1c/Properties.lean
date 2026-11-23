import CardanoLedgerApi.V3
import LiveScripts.S_ce8f72aac53cf64f40bc0b54658821b4d5f5393a7321034e63e6fa1c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ce8f72aac53cf64f40bc0b54658821b4d5f5393a7321034e63e6fa1c.script (mintingInputs ctx) 1000)]
