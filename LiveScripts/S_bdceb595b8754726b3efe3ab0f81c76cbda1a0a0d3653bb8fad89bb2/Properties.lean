import CardanoLedgerApi.V2
import LiveScripts.S_bdceb595b8754726b3efe3ab0f81c76cbda1a0a0d3653bb8fad89bb2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bdceb595b8754726b3efe3ab0f81c76cbda1a0a0d3653bb8fad89bb2.script (mintingInputs input) 1000)]
