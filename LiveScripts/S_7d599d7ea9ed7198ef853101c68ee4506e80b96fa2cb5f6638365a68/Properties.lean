import CardanoLedgerApi.V3
import LiveScripts.S_7d599d7ea9ed7198ef853101c68ee4506e80b96fa2cb5f6638365a68.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7d599d7ea9ed7198ef853101c68ee4506e80b96fa2cb5f6638365a68.script (certifyingInputs ctx) 1000)]
