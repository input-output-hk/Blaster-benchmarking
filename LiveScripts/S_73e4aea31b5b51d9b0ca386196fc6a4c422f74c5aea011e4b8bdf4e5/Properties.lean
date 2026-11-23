import CardanoLedgerApi.V3
import LiveScripts.S_73e4aea31b5b51d9b0ca386196fc6a4c422f74c5aea011e4b8bdf4e5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_73e4aea31b5b51d9b0ca386196fc6a4c422f74c5aea011e4b8bdf4e5.script (mintingInputs ctx) 1000)]
