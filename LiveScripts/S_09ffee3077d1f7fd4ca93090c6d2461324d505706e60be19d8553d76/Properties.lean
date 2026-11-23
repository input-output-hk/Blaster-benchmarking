import CardanoLedgerApi.V3
import LiveScripts.S_09ffee3077d1f7fd4ca93090c6d2461324d505706e60be19d8553d76.Script
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
      ¬ isSuccessful (cekExecuteProgram script_09ffee3077d1f7fd4ca93090c6d2461324d505706e60be19d8553d76.script (mintingInputs ctx) 1000)]
