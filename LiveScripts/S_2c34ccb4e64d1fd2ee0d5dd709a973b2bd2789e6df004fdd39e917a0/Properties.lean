import CardanoLedgerApi.V3
import LiveScripts.S_2c34ccb4e64d1fd2ee0d5dd709a973b2bd2789e6df004fdd39e917a0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2c34ccb4e64d1fd2ee0d5dd709a973b2bd2789e6df004fdd39e917a0.script (certifyingInputs ctx) 1000)]
