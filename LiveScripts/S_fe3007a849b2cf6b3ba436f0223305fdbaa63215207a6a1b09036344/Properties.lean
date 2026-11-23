import CardanoLedgerApi.V2
import LiveScripts.S_fe3007a849b2cf6b3ba436f0223305fdbaa63215207a6a1b09036344.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fe3007a849b2cf6b3ba436f0223305fdbaa63215207a6a1b09036344.script (mintingInputs input) 1000)]
