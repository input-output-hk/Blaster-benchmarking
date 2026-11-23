import CardanoLedgerApi.V2
import LiveScripts.S_45204e64ebd1d05e8c983e74b1d6dbe0898dfbd2c7f34355d87b7b71.Script
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
      ¬ isSuccessful (cekExecuteProgram script_45204e64ebd1d05e8c983e74b1d6dbe0898dfbd2c7f34355d87b7b71.script (mintingInputs input) 1000)]
