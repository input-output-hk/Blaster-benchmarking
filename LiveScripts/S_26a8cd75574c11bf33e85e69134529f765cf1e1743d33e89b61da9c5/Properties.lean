import CardanoLedgerApi.V3
import LiveScripts.S_26a8cd75574c11bf33e85e69134529f765cf1e1743d33e89b61da9c5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_26a8cd75574c11bf33e85e69134529f765cf1e1743d33e89b61da9c5.script (mintingInputs ctx) 1000)]
