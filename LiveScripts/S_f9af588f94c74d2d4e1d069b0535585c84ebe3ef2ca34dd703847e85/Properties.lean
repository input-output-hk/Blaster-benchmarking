import CardanoLedgerApi.V1
import LiveScripts.S_f9af588f94c74d2d4e1d069b0535585c84ebe3ef2ca34dd703847e85.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f9af588f94c74d2d4e1d069b0535585c84ebe3ef2ca34dd703847e85.script (mintingInputs input) 1000)]
