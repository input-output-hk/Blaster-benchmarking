import CardanoLedgerApi.V2
import LiveScripts.S_d3ff4ac09b0978b1ef7f830fd04d79c4246b53b8bcb08108f4ac5d98.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d3ff4ac09b0978b1ef7f830fd04d79c4246b53b8bcb08108f4ac5d98.script (mintingInputs input) 1000)]
