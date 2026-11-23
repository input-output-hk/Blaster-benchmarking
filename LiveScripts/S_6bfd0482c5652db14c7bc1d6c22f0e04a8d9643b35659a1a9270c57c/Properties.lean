import CardanoLedgerApi.V3
import LiveScripts.S_6bfd0482c5652db14c7bc1d6c22f0e04a8d9643b35659a1a9270c57c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6bfd0482c5652db14c7bc1d6c22f0e04a8d9643b35659a1a9270c57c.script (certifyingInputs ctx) 1000)]
