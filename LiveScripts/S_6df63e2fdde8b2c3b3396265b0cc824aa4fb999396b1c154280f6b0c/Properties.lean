import CardanoLedgerApi.V2
import LiveScripts.S_6df63e2fdde8b2c3b3396265b0cc824aa4fb999396b1c154280f6b0c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6df63e2fdde8b2c3b3396265b0cc824aa4fb999396b1c154280f6b0c.script (mintingInputs input) 1000)]
