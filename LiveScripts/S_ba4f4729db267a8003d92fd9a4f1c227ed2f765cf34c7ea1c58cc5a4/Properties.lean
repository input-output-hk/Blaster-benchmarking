import CardanoLedgerApi.V3
import LiveScripts.S_ba4f4729db267a8003d92fd9a4f1c227ed2f765cf34c7ea1c58cc5a4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ba4f4729db267a8003d92fd9a4f1c227ed2f765cf34c7ea1c58cc5a4.script (mintingInputs ctx) 1000)]
