import CardanoLedgerApi.V3
import LiveScripts.S_1702ca718e613d601e30c7166c6cfa7b8b4bf626bfdca9272709a82a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1702ca718e613d601e30c7166c6cfa7b8b4bf626bfdca9272709a82a.script (mintingInputs ctx) 1000)]
