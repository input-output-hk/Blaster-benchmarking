import CardanoLedgerApi.V3
import LiveScripts.S_ee2f280f1b5622eb79ff73b7698767682a450d07f1c67b0dcba912eb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ee2f280f1b5622eb79ff73b7698767682a450d07f1c67b0dcba912eb.script (mintingInputs ctx) 1000)]
