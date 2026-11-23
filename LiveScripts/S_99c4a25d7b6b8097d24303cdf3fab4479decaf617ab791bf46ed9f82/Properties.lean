import CardanoLedgerApi.V3
import LiveScripts.S_99c4a25d7b6b8097d24303cdf3fab4479decaf617ab791bf46ed9f82.Script
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
      ¬ isSuccessful (cekExecuteProgram script_99c4a25d7b6b8097d24303cdf3fab4479decaf617ab791bf46ed9f82.script (mintingInputs ctx) 1000)]
