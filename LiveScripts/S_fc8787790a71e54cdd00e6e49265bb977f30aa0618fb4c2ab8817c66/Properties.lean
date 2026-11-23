import CardanoLedgerApi.V3
import LiveScripts.S_fc8787790a71e54cdd00e6e49265bb977f30aa0618fb4c2ab8817c66.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: cert; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validCertifyingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_fc8787790a71e54cdd00e6e49265bb977f30aa0618fb4c2ab8817c66.script (certifyingInputs ctx) 1000)]
