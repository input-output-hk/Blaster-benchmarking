import CardanoLedgerApi.V3
import LiveScripts.S_d1bd4c02a6c80e68050739d7f1a562600a0a8ddca24c86731d4594bb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d1bd4c02a6c80e68050739d7f1a562600a0a8ddca24c86731d4594bb.script (mintingInputs ctx) 1000)]
