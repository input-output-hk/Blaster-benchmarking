import CardanoLedgerApi.V2
import LiveScripts.S_d2c1c3f9f65af364168b0cbb1524ce3a70413fcf20a3a51e082f28dd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d2c1c3f9f65af364168b0cbb1524ce3a70413fcf20a3a51e082f28dd.script (mintingInputs input) 1000)]
