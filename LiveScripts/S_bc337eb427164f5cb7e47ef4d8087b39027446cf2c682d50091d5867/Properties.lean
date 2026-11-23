import CardanoLedgerApi.V3
import LiveScripts.S_bc337eb427164f5cb7e47ef4d8087b39027446cf2c682d50091d5867.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bc337eb427164f5cb7e47ef4d8087b39027446cf2c682d50091d5867.script (mintingInputs ctx) 1000)]
