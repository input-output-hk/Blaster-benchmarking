import CardanoLedgerApi.V3
import LiveScripts.S_e4bd6155ad729e6ee45ab843ffa884a9d2027fab3ff064796b4b2c72.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e4bd6155ad729e6ee45ab843ffa884a9d2027fab3ff064796b4b2c72.script (certifyingInputs ctx) 1000)]
