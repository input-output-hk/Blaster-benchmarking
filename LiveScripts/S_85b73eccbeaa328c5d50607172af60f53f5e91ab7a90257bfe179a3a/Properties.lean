import CardanoLedgerApi.V3
import LiveScripts.S_85b73eccbeaa328c5d50607172af60f53f5e91ab7a90257bfe179a3a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_85b73eccbeaa328c5d50607172af60f53f5e91ab7a90257bfe179a3a.script (certifyingInputs ctx) 1000)]
