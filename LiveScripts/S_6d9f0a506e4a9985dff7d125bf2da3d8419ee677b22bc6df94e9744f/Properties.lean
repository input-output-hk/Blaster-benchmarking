import CardanoLedgerApi.V3
import LiveScripts.S_6d9f0a506e4a9985dff7d125bf2da3d8419ee677b22bc6df94e9744f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6d9f0a506e4a9985dff7d125bf2da3d8419ee677b22bc6df94e9744f.script (mintingInputs ctx) 1000)]
