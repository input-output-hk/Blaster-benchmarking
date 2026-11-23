import CardanoLedgerApi.V3
import LiveScripts.S_7c7152fa2e7b88db1f1d87987bfe35d8451ce3546fbb8b6c9e116fce.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7c7152fa2e7b88db1f1d87987bfe35d8451ce3546fbb8b6c9e116fce.script (mintingInputs ctx) 1000)]
