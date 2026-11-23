import CardanoLedgerApi.V1
import LiveScripts.S_197e41d5e3911e968e3c0c72acb891511aadccb792693af82592c598.Script
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
      ¬ isSuccessful (cekExecuteProgram script_197e41d5e3911e968e3c0c72acb891511aadccb792693af82592c598.script (mintingInputs input) 1000)]
