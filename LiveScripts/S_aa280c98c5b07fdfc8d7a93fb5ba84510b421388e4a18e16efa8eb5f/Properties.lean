import CardanoLedgerApi.V2
import LiveScripts.S_aa280c98c5b07fdfc8d7a93fb5ba84510b421388e4a18e16efa8eb5f.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : MintingInput,
    validMintingContext input →
      ¬ isSuccessful (cekExecuteProgram script_aa280c98c5b07fdfc8d7a93fb5ba84510b421388e4a18e16efa8eb5f.script (mintingInputs input) 1000)]
