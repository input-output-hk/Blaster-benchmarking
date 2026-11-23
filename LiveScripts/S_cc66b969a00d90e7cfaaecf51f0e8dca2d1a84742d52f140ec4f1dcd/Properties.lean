import CardanoLedgerApi.V3
import LiveScripts.S_cc66b969a00d90e7cfaaecf51f0e8dca2d1a84742d52f140ec4f1dcd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cc66b969a00d90e7cfaaecf51f0e8dca2d1a84742d52f140ec4f1dcd.script (certifyingInputs ctx) 1000)]
