import CardanoLedgerApi.V2
import LiveScripts.S_34293de1784ad1dec6f8c975e220c5dab93e636c8d877f99d89c42ce.Script
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
      ¬ isSuccessful (cekExecuteProgram script_34293de1784ad1dec6f8c975e220c5dab93e636c8d877f99d89c42ce.script (mintingInputs input) 1000)]
