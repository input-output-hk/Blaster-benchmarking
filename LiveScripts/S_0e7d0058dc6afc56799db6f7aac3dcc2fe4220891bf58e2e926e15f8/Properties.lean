import CardanoLedgerApi.V1
import LiveScripts.S_0e7d0058dc6afc56799db6f7aac3dcc2fe4220891bf58e2e926e15f8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0e7d0058dc6afc56799db6f7aac3dcc2fe4220891bf58e2e926e15f8.script (mintingInputs input) 1000)]
