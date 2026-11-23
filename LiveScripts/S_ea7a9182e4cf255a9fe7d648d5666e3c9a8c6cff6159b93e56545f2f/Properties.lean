import CardanoLedgerApi.V1
import LiveScripts.S_ea7a9182e4cf255a9fe7d648d5666e3c9a8c6cff6159b93e56545f2f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ea7a9182e4cf255a9fe7d648d5666e3c9a8c6cff6159b93e56545f2f.script (mintingInputs input) 1000)]
