import CardanoLedgerApi.V3
import LiveScripts.S_2fc64951d5ac7860534d44b45d52fdde934a46dede6d7793b686f8ca.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2fc64951d5ac7860534d44b45d52fdde934a46dede6d7793b686f8ca.script (mintingInputs ctx) 1000)]
