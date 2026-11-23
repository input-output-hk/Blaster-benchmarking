import CardanoLedgerApi.V3
import LiveScripts.S_316a4969e413625f7b1949ebb2d3364cd068c8a4b3f7fbca9e2ff4c2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_316a4969e413625f7b1949ebb2d3364cd068c8a4b3f7fbca9e2ff4c2.script (certifyingInputs ctx) 1000)]
