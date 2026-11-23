import CardanoLedgerApi.V2
import LiveScripts.S_ac49e0969d76ed5aa9e9861a77be65f4fc29e9a979dc4c37a99eb8f4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ac49e0969d76ed5aa9e9861a77be65f4fc29e9a979dc4c37a99eb8f4.script (mintingInputs input) 1000)]
