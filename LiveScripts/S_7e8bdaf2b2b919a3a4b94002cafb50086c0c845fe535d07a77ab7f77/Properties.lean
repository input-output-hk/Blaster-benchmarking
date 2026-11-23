import CardanoLedgerApi.V3
import LiveScripts.S_7e8bdaf2b2b919a3a4b94002cafb50086c0c845fe535d07a77ab7f77.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7e8bdaf2b2b919a3a4b94002cafb50086c0c845fe535d07a77ab7f77.script (mintingInputs ctx) 1000)]
