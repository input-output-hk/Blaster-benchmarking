import CardanoLedgerApi.V3
import LiveScripts.S_8d35bd4b654983a6cc3c7afab779567bba4fdf7cfee4375cc61b4489.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8d35bd4b654983a6cc3c7afab779567bba4fdf7cfee4375cc61b4489.script (certifyingInputs ctx) 1000)]
