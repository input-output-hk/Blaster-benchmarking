import CardanoLedgerApi.V2
import LiveScripts.S_41223b3ecf502363dc465dce5ad6671b83ac790e229d3f49e68c3353.Script
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
      ¬ isSuccessful (cekExecuteProgram script_41223b3ecf502363dc465dce5ad6671b83ac790e229d3f49e68c3353.script (mintingInputs input) 1000)]
