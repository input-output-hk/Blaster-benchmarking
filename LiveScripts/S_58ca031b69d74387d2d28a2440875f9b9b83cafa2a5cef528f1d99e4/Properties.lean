import CardanoLedgerApi.V3
import LiveScripts.S_58ca031b69d74387d2d28a2440875f9b9b83cafa2a5cef528f1d99e4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_58ca031b69d74387d2d28a2440875f9b9b83cafa2a5cef528f1d99e4.script (mintingInputs ctx) 1000)]
