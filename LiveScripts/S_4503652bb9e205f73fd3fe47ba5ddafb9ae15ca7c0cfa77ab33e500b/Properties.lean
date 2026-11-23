import CardanoLedgerApi.V1
import LiveScripts.S_4503652bb9e205f73fd3fe47ba5ddafb9ae15ca7c0cfa77ab33e500b.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V1
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : MintingInput,
    validMintingContext input →
      ¬ isSuccessful (cekExecuteProgram script_4503652bb9e205f73fd3fe47ba5ddafb9ae15ca7c0cfa77ab33e500b.script (mintingInputs input) 1000)]
