import CardanoLedgerApi.V3
import LiveScripts.S_cb493417b74c71bc64f20bd50d20cd5a4068d3abf1c0a3c33a3979ca.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cb493417b74c71bc64f20bd50d20cd5a4068d3abf1c0a3c33a3979ca.script (mintingInputs ctx) 1000)]
