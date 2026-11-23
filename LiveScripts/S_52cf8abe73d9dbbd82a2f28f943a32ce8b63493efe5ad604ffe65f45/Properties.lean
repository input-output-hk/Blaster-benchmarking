import CardanoLedgerApi.V3
import LiveScripts.S_52cf8abe73d9dbbd82a2f28f943a32ce8b63493efe5ad604ffe65f45.Script
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
      ¬ isSuccessful (cekExecuteProgram script_52cf8abe73d9dbbd82a2f28f943a32ce8b63493efe5ad604ffe65f45.script (certifyingInputs ctx) 1000)]
