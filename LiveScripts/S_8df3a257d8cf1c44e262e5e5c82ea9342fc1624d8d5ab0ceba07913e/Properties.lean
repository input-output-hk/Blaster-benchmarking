import CardanoLedgerApi.V3
import LiveScripts.S_8df3a257d8cf1c44e262e5e5c82ea9342fc1624d8d5ab0ceba07913e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8df3a257d8cf1c44e262e5e5c82ea9342fc1624d8d5ab0ceba07913e.script (mintingInputs ctx) 1000)]
