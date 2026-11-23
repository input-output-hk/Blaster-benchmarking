import CardanoLedgerApi.V3
import LiveScripts.S_9cfd6ea9445c323a7980546fdfad66a5d9eb44abf3d533f1a46ccc0c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9cfd6ea9445c323a7980546fdfad66a5d9eb44abf3d533f1a46ccc0c.script (mintingInputs ctx) 1000)]
