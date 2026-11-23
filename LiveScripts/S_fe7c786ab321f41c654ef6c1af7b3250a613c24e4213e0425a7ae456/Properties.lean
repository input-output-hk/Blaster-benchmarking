import CardanoLedgerApi.V2
import LiveScripts.S_fe7c786ab321f41c654ef6c1af7b3250a613c24e4213e0425a7ae456.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fe7c786ab321f41c654ef6c1af7b3250a613c24e4213e0425a7ae456.script (mintingInputs input) 1000)]
