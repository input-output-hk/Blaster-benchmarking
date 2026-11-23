import CardanoLedgerApi.V3
import LiveScripts.S_d3b1a4b80837a5e78d9e6cb28a562b17f3050818a1a358b65b5a90e9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d3b1a4b80837a5e78d9e6cb28a562b17f3050818a1a358b65b5a90e9.script (certifyingInputs ctx) 1000)]
