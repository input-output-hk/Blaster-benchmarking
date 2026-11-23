import CardanoLedgerApi.V1
import LiveScripts.S_9b7a1b722ffe30c7a37dc5312cef39e9569866c6f7874f4163577dff.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9b7a1b722ffe30c7a37dc5312cef39e9569866c6f7874f4163577dff.script (mintingInputs input) 1000)]
