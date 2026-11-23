import CardanoLedgerApi.V3
import LiveScripts.S_a7a054cbb875e4882f1f3248a078643e66f3d00271c0a74f4d85b477.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a7a054cbb875e4882f1f3248a078643e66f3d00271c0a74f4d85b477.script (mintingInputs ctx) 1000)]
