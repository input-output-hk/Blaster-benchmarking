import CardanoLedgerApi.V2
import LiveScripts.S_63f947b8d9535bc4e4ce6919e3dc056547e8d30ada12f29aa5f826b8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_63f947b8d9535bc4e4ce6919e3dc056547e8d30ada12f29aa5f826b8.script (mintingInputs input) 1000)]
