import CardanoLedgerApi.V1
import LiveScripts.S_8d1eebfb7948248299d0cee23b85c18ee42c5fa64198e9aef5d5dd7e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8d1eebfb7948248299d0cee23b85c18ee42c5fa64198e9aef5d5dd7e.script (mintingInputs input) 1000)]
