import CardanoLedgerApi.V3
import LiveScripts.S_386fe8c7c8ecd2f6729f2ce0f5b59cd56f9f3ff2729ffd6451124d17.Script
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
      ¬ isSuccessful (cekExecuteProgram script_386fe8c7c8ecd2f6729f2ce0f5b59cd56f9f3ff2729ffd6451124d17.script (certifyingInputs ctx) 1000)]
