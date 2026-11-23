import CardanoLedgerApi.V2
import LiveScripts.S_12c8a522ca40065bc742b2d9733338a67e6ee7baa7adb73291a4222f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_12c8a522ca40065bc742b2d9733338a67e6ee7baa7adb73291a4222f.script (mintingInputs input) 1000)]
