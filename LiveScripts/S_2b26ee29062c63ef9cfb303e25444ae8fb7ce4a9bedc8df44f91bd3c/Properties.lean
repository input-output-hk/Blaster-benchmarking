import CardanoLedgerApi.V3
import LiveScripts.S_2b26ee29062c63ef9cfb303e25444ae8fb7ce4a9bedc8df44f91bd3c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2b26ee29062c63ef9cfb303e25444ae8fb7ce4a9bedc8df44f91bd3c.script (certifyingInputs ctx) 1000)]
