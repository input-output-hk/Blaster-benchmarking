import CardanoLedgerApi.V2
import LiveScripts.S_b122b2fc62557df9c3fd0b5c62a4b2c970a0d711560e0a8dd7b264f3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b122b2fc62557df9c3fd0b5c62a4b2c970a0d711560e0a8dd7b264f3.script (mintingInputs input) 1000)]
