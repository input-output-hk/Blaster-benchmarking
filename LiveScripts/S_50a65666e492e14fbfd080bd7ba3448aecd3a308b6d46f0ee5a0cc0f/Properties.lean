import CardanoLedgerApi.V3
import LiveScripts.S_50a65666e492e14fbfd080bd7ba3448aecd3a308b6d46f0ee5a0cc0f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_50a65666e492e14fbfd080bd7ba3448aecd3a308b6d46f0ee5a0cc0f.script (certifyingInputs ctx) 1000)]
