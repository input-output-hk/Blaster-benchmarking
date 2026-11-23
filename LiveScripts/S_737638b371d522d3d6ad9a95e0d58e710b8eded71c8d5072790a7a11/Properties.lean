import CardanoLedgerApi.V2
import LiveScripts.S_737638b371d522d3d6ad9a95e0d58e710b8eded71c8d5072790a7a11.Script
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
      ¬ isSuccessful (cekExecuteProgram script_737638b371d522d3d6ad9a95e0d58e710b8eded71c8d5072790a7a11.script (mintingInputs input) 1000)]
