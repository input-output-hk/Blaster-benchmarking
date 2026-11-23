import CardanoLedgerApi.V3
import LiveScripts.S_b43903b6c4847a3386b145b2bee2b3a02ca2222512f302a14fea82da.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b43903b6c4847a3386b145b2bee2b3a02ca2222512f302a14fea82da.script (mintingInputs ctx) 1000)]
