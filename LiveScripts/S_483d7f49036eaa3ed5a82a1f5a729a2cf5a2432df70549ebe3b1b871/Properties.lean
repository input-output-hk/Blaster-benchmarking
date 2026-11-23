import CardanoLedgerApi.V1
import LiveScripts.S_483d7f49036eaa3ed5a82a1f5a729a2cf5a2432df70549ebe3b1b871.Script
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
      ¬ isSuccessful (cekExecuteProgram script_483d7f49036eaa3ed5a82a1f5a729a2cf5a2432df70549ebe3b1b871.script (mintingInputs input) 1000)]
