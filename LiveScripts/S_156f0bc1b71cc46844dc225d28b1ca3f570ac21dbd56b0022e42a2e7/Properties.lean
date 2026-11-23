import CardanoLedgerApi.V3
import LiveScripts.S_156f0bc1b71cc46844dc225d28b1ca3f570ac21dbd56b0022e42a2e7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_156f0bc1b71cc46844dc225d28b1ca3f570ac21dbd56b0022e42a2e7.script (mintingInputs ctx) 1000)]
