import CardanoLedgerApi.V2
import LiveScripts.S_5ec37726eebe67f1db9f84e739b24e9e4dbb4c632a36a50ce74bfc86.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5ec37726eebe67f1db9f84e739b24e9e4dbb4c632a36a50ce74bfc86.script (mintingInputs input) 1000)]
