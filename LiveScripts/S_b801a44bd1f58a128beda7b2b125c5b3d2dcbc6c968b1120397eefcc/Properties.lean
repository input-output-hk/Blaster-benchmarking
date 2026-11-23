import CardanoLedgerApi.V3
import LiveScripts.S_b801a44bd1f58a128beda7b2b125c5b3d2dcbc6c968b1120397eefcc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b801a44bd1f58a128beda7b2b125c5b3d2dcbc6c968b1120397eefcc.script (mintingInputs ctx) 1000)]
