import CardanoLedgerApi.V3
import LiveScripts.S_de8d3cb923a28afedbe79b02f25b0bafa039c9b2a444e9f45d8a9bac.Script
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
      ¬ isSuccessful (cekExecuteProgram script_de8d3cb923a28afedbe79b02f25b0bafa039c9b2a444e9f45d8a9bac.script (mintingInputs ctx) 1000)]
