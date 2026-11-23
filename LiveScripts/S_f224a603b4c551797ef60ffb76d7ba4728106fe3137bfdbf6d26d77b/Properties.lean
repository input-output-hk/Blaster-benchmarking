import CardanoLedgerApi.V3
import LiveScripts.S_f224a603b4c551797ef60ffb76d7ba4728106fe3137bfdbf6d26d77b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f224a603b4c551797ef60ffb76d7ba4728106fe3137bfdbf6d26d77b.script (mintingInputs ctx) 1000)]
