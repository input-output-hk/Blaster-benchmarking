import CardanoLedgerApi.V3
import LiveScripts.S_4d58c9e2c76ed8a966b6dde741f9a47d34856c69328bf6a477ac5dd3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4d58c9e2c76ed8a966b6dde741f9a47d34856c69328bf6a477ac5dd3.script (mintingInputs ctx) 1000)]
