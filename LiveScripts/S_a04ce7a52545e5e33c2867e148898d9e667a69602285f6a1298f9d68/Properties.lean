import CardanoLedgerApi.V2
import LiveScripts.S_a04ce7a52545e5e33c2867e148898d9e667a69602285f6a1298f9d68.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a04ce7a52545e5e33c2867e148898d9e667a69602285f6a1298f9d68.script (mintingInputs input) 1000)]
