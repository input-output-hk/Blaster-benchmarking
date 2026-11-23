import CardanoLedgerApi.V2
import LiveScripts.S_5b042cf53c0b2ce4f30a9e743b4871ad8c6dcdf1d845133395f55a8e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5b042cf53c0b2ce4f30a9e743b4871ad8c6dcdf1d845133395f55a8e.script (mintingInputs input) 1000)]
