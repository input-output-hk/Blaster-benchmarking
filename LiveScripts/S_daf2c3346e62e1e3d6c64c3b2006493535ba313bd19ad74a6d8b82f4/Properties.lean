import CardanoLedgerApi.V3
import LiveScripts.S_daf2c3346e62e1e3d6c64c3b2006493535ba313bd19ad74a6d8b82f4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_daf2c3346e62e1e3d6c64c3b2006493535ba313bd19ad74a6d8b82f4.script (mintingInputs ctx) 1000)]
