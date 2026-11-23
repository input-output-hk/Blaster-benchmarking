import CardanoLedgerApi.V2
import LiveScripts.S_f66d78b4a3cb3d37afa0ec36461e51ecbde00f26c8f0a68f94b69880.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f66d78b4a3cb3d37afa0ec36461e51ecbde00f26c8f0a68f94b69880.script (mintingInputs input) 1000)]
