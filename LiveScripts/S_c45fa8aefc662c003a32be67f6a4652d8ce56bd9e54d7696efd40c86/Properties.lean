import CardanoLedgerApi.V2
import LiveScripts.S_c45fa8aefc662c003a32be67f6a4652d8ce56bd9e54d7696efd40c86.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c45fa8aefc662c003a32be67f6a4652d8ce56bd9e54d7696efd40c86.script (mintingInputs input) 1000)]
