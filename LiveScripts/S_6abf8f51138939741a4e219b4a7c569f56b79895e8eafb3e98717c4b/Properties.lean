import CardanoLedgerApi.V1
import LiveScripts.S_6abf8f51138939741a4e219b4a7c569f56b79895e8eafb3e98717c4b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6abf8f51138939741a4e219b4a7c569f56b79895e8eafb3e98717c4b.script (mintingInputs input) 1000)]
