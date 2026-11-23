import CardanoLedgerApi.V2
import LiveScripts.S_7a4d45e6b4e6835c4cea3968f291fab3704949cfd2f2dc1997c4eeec.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7a4d45e6b4e6835c4cea3968f291fab3704949cfd2f2dc1997c4eeec.script (mintingInputs input) 1000)]
