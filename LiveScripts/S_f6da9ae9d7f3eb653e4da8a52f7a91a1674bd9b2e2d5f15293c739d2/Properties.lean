import CardanoLedgerApi.V2
import LiveScripts.S_f6da9ae9d7f3eb653e4da8a52f7a91a1674bd9b2e2d5f15293c739d2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f6da9ae9d7f3eb653e4da8a52f7a91a1674bd9b2e2d5f15293c739d2.script (mintingInputs input) 1000)]
