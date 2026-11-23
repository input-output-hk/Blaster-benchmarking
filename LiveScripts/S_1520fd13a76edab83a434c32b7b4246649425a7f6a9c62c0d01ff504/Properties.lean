import CardanoLedgerApi.V3
import LiveScripts.S_1520fd13a76edab83a434c32b7b4246649425a7f6a9c62c0d01ff504.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1520fd13a76edab83a434c32b7b4246649425a7f6a9c62c0d01ff504.script (mintingInputs ctx) 1000)]
