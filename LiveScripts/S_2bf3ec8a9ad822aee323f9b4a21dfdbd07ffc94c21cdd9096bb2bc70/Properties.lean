import CardanoLedgerApi.V3
import LiveScripts.S_2bf3ec8a9ad822aee323f9b4a21dfdbd07ffc94c21cdd9096bb2bc70.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2bf3ec8a9ad822aee323f9b4a21dfdbd07ffc94c21cdd9096bb2bc70.script (mintingInputs ctx) 1000)]
