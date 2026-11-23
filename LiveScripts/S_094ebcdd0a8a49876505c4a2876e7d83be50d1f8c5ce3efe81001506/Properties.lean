import CardanoLedgerApi.V3
import LiveScripts.S_094ebcdd0a8a49876505c4a2876e7d83be50d1f8c5ce3efe81001506.Script
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
      ¬ isSuccessful (cekExecuteProgram script_094ebcdd0a8a49876505c4a2876e7d83be50d1f8c5ce3efe81001506.script (mintingInputs ctx) 1000)]
