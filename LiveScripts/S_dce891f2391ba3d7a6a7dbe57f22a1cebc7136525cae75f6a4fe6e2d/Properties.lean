import CardanoLedgerApi.V1
import LiveScripts.S_dce891f2391ba3d7a6a7dbe57f22a1cebc7136525cae75f6a4fe6e2d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dce891f2391ba3d7a6a7dbe57f22a1cebc7136525cae75f6a4fe6e2d.script (mintingInputs input) 1000)]
