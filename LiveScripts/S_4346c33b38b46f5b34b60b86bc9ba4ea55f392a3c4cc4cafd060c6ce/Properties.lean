import CardanoLedgerApi.V3
import LiveScripts.S_4346c33b38b46f5b34b60b86bc9ba4ea55f392a3c4cc4cafd060c6ce.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4346c33b38b46f5b34b60b86bc9ba4ea55f392a3c4cc4cafd060c6ce.script (mintingInputs ctx) 1000)]
