import CardanoLedgerApi.V2
import LiveScripts.S_50ed8de918b0d944215e69688536cbe2d7484c744c4e11b9d8b9fc07.Script
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
      ¬ isSuccessful (cekExecuteProgram script_50ed8de918b0d944215e69688536cbe2d7484c744c4e11b9d8b9fc07.script (mintingInputs input) 1000)]
