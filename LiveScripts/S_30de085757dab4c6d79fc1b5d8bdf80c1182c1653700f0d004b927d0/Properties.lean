import CardanoLedgerApi.V3
import LiveScripts.S_30de085757dab4c6d79fc1b5d8bdf80c1182c1653700f0d004b927d0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_30de085757dab4c6d79fc1b5d8bdf80c1182c1653700f0d004b927d0.script (mintingInputs ctx) 1000)]
