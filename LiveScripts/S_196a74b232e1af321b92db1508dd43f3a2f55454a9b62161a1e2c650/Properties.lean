import CardanoLedgerApi.V3
import LiveScripts.S_196a74b232e1af321b92db1508dd43f3a2f55454a9b62161a1e2c650.Script
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
      ¬ isSuccessful (cekExecuteProgram script_196a74b232e1af321b92db1508dd43f3a2f55454a9b62161a1e2c650.script (certifyingInputs ctx) 1000)]
