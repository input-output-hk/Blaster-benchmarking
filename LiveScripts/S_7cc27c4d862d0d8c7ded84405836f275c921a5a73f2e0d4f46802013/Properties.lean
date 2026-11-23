import CardanoLedgerApi.V2
import LiveScripts.S_7cc27c4d862d0d8c7ded84405836f275c921a5a73f2e0d4f46802013.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7cc27c4d862d0d8c7ded84405836f275c921a5a73f2e0d4f46802013.script (mintingInputs input) 1000)]
