import CardanoLedgerApi.V2
import LiveScripts.S_9e00df0615de0a7b121a7f961d43e23165b8e81b64786c6eb708d370.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9e00df0615de0a7b121a7f961d43e23165b8e81b64786c6eb708d370.script (mintingInputs input) 1000)]
