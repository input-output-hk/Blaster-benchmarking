import CardanoLedgerApi.V3
import LiveScripts.S_0de7ecabf1ee6e44318130d606891dd824d087528f81e2b31358d9b1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0de7ecabf1ee6e44318130d606891dd824d087528f81e2b31358d9b1.script (certifyingInputs ctx) 1000)]
