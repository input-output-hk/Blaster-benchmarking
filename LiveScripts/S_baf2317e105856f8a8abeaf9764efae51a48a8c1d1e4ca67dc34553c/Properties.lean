import CardanoLedgerApi.V3
import LiveScripts.S_baf2317e105856f8a8abeaf9764efae51a48a8c1d1e4ca67dc34553c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_baf2317e105856f8a8abeaf9764efae51a48a8c1d1e4ca67dc34553c.script (mintingInputs ctx) 1000)]
