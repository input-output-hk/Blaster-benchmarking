import CardanoLedgerApi.V3
import LiveScripts.S_2b6a490b7ea8d0b6d74819f42c5f540f9cc5c76c712424509dce8a26.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2b6a490b7ea8d0b6d74819f42c5f540f9cc5c76c712424509dce8a26.script (mintingInputs ctx) 1000)]
