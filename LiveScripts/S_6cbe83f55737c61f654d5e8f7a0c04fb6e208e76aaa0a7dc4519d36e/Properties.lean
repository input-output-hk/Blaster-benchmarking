import CardanoLedgerApi.V2
import LiveScripts.S_6cbe83f55737c61f654d5e8f7a0c04fb6e208e76aaa0a7dc4519d36e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6cbe83f55737c61f654d5e8f7a0c04fb6e208e76aaa0a7dc4519d36e.script (mintingInputs input) 1000)]
