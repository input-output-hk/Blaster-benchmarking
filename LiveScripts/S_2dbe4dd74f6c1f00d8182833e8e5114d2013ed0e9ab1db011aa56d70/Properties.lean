import CardanoLedgerApi.V3
import LiveScripts.S_2dbe4dd74f6c1f00d8182833e8e5114d2013ed0e9ab1db011aa56d70.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2dbe4dd74f6c1f00d8182833e8e5114d2013ed0e9ab1db011aa56d70.script (certifyingInputs ctx) 1000)]
