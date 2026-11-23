import CardanoLedgerApi.V3
import LiveScripts.S_d1bb9d075e3893feebdea9a351b2a122e0fb8b7d4dc6d8ddecf4003d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d1bb9d075e3893feebdea9a351b2a122e0fb8b7d4dc6d8ddecf4003d.script (mintingInputs ctx) 1000)]
