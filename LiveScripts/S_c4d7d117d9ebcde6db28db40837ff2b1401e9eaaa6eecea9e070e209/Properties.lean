import CardanoLedgerApi.V2
import LiveScripts.S_c4d7d117d9ebcde6db28db40837ff2b1401e9eaaa6eecea9e070e209.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c4d7d117d9ebcde6db28db40837ff2b1401e9eaaa6eecea9e070e209.script (mintingInputs input) 1000)]
