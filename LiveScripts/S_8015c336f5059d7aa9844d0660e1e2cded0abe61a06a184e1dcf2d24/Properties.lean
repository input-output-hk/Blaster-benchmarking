import CardanoLedgerApi.V3
import LiveScripts.S_8015c336f5059d7aa9844d0660e1e2cded0abe61a06a184e1dcf2d24.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8015c336f5059d7aa9844d0660e1e2cded0abe61a06a184e1dcf2d24.script (mintingInputs ctx) 1000)]
