import CardanoLedgerApi.V3
import LiveScripts.S_9aa880b46f8b66197cc3d401e64ba48c05b4e3e026798e488fa04131.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9aa880b46f8b66197cc3d401e64ba48c05b4e3e026798e488fa04131.script (certifyingInputs ctx) 1000)]
