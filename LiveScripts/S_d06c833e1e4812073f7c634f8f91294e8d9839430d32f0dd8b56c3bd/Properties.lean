import CardanoLedgerApi.V3
import LiveScripts.S_d06c833e1e4812073f7c634f8f91294e8d9839430d32f0dd8b56c3bd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d06c833e1e4812073f7c634f8f91294e8d9839430d32f0dd8b56c3bd.script (certifyingInputs ctx) 1000)]
