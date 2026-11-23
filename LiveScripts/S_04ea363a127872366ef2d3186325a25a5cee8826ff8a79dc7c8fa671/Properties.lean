import CardanoLedgerApi.V2
import LiveScripts.S_04ea363a127872366ef2d3186325a25a5cee8826ff8a79dc7c8fa671.Script
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
      ¬ isSuccessful (cekExecuteProgram script_04ea363a127872366ef2d3186325a25a5cee8826ff8a79dc7c8fa671.script (mintingInputs input) 1000)]
