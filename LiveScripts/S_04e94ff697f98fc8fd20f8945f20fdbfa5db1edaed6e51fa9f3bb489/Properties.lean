import CardanoLedgerApi.V1
import LiveScripts.S_04e94ff697f98fc8fd20f8945f20fdbfa5db1edaed6e51fa9f3bb489.Script
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
      ¬ isSuccessful (cekExecuteProgram script_04e94ff697f98fc8fd20f8945f20fdbfa5db1edaed6e51fa9f3bb489.script (mintingInputs input) 1000)]
