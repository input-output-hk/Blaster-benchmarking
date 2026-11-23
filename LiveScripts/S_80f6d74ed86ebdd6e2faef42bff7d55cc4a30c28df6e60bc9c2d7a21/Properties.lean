import CardanoLedgerApi.V1
import LiveScripts.S_80f6d74ed86ebdd6e2faef42bff7d55cc4a30c28df6e60bc9c2d7a21.Script
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
      ¬ isSuccessful (cekExecuteProgram script_80f6d74ed86ebdd6e2faef42bff7d55cc4a30c28df6e60bc9c2d7a21.script (mintingInputs input) 1000)]
