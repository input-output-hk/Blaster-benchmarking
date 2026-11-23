import CardanoLedgerApi.V3
import LiveScripts.S_496c564cf2c52bb4b1ae85ccbd67a8cb53c4a838f095805b7878c343.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validMintingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_496c564cf2c52bb4b1ae85ccbd67a8cb53c4a838f095805b7878c343.script (mintingInputs ctx) 1000)]
