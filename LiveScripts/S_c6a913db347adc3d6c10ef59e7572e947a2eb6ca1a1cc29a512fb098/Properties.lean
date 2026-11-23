import CardanoLedgerApi.V3
import LiveScripts.S_c6a913db347adc3d6c10ef59e7572e947a2eb6ca1a1cc29a512fb098.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c6a913db347adc3d6c10ef59e7572e947a2eb6ca1a1cc29a512fb098.script (certifyingInputs ctx) 1000)]
