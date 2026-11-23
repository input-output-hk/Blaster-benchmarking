import CardanoLedgerApi.V3
import LiveScripts.S_bcf4db6d2ceff381aa89871e61b4a5fc5ef6ead733b40f7a3547ff91.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bcf4db6d2ceff381aa89871e61b4a5fc5ef6ead733b40f7a3547ff91.script (certifyingInputs ctx) 1000)]
