import CardanoLedgerApi.V1
import LiveScripts.S_74f47b9b70c7fd73b5bd31cf4514fd7a1ff0839daf62aa2c56b5211a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_74f47b9b70c7fd73b5bd31cf4514fd7a1ff0839daf62aa2c56b5211a.script (mintingInputs input) 1000)]
