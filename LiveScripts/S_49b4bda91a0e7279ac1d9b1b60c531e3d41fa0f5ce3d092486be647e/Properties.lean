import CardanoLedgerApi.V3
import LiveScripts.S_49b4bda91a0e7279ac1d9b1b60c531e3d41fa0f5ce3d092486be647e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_49b4bda91a0e7279ac1d9b1b60c531e3d41fa0f5ce3d092486be647e.script (mintingInputs ctx) 1000)]
