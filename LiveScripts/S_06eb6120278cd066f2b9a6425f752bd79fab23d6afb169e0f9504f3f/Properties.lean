import CardanoLedgerApi.V3
import LiveScripts.S_06eb6120278cd066f2b9a6425f752bd79fab23d6afb169e0f9504f3f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_06eb6120278cd066f2b9a6425f752bd79fab23d6afb169e0f9504f3f.script (mintingInputs ctx) 1000)]
