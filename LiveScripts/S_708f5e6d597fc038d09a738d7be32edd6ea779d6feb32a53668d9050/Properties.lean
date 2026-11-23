import CardanoLedgerApi.V2
import LiveScripts.S_708f5e6d597fc038d09a738d7be32edd6ea779d6feb32a53668d9050.Script
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
      ¬ isSuccessful (cekExecuteProgram script_708f5e6d597fc038d09a738d7be32edd6ea779d6feb32a53668d9050.script (mintingInputs input) 1000)]
