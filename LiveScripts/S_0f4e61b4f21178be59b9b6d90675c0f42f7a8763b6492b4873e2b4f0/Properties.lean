import CardanoLedgerApi.V2
import LiveScripts.S_0f4e61b4f21178be59b9b6d90675c0f42f7a8763b6492b4873e2b4f0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0f4e61b4f21178be59b9b6d90675c0f42f7a8763b6492b4873e2b4f0.script (mintingInputs input) 1000)]
