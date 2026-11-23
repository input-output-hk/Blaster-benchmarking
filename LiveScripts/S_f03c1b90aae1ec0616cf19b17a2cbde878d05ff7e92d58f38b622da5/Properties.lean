import CardanoLedgerApi.V3
import LiveScripts.S_f03c1b90aae1ec0616cf19b17a2cbde878d05ff7e92d58f38b622da5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f03c1b90aae1ec0616cf19b17a2cbde878d05ff7e92d58f38b622da5.script (certifyingInputs ctx) 1000)]
