import CardanoLedgerApi.V3
import LiveScripts.S_d3eb03a9d8a323c3aed63102fbabb19ded46e74a71d3a2b46db29719.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d3eb03a9d8a323c3aed63102fbabb19ded46e74a71d3a2b46db29719.script (mintingInputs ctx) 1000)]
