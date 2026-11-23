import CardanoLedgerApi.V1
import LiveScripts.S_0eb8f8ca83e684b7c92cb6b8d2886ca744cfc8ce3b4622dc21d37bf3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0eb8f8ca83e684b7c92cb6b8d2886ca744cfc8ce3b4622dc21d37bf3.script (mintingInputs input) 1000)]
