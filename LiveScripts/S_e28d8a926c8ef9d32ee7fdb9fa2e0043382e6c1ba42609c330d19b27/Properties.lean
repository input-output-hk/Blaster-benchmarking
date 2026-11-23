import CardanoLedgerApi.V3
import LiveScripts.S_e28d8a926c8ef9d32ee7fdb9fa2e0043382e6c1ba42609c330d19b27.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e28d8a926c8ef9d32ee7fdb9fa2e0043382e6c1ba42609c330d19b27.script (certifyingInputs ctx) 1000)]
