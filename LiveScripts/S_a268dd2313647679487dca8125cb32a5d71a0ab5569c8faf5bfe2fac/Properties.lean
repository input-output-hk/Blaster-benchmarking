import CardanoLedgerApi.V3
import LiveScripts.S_a268dd2313647679487dca8125cb32a5d71a0ab5569c8faf5bfe2fac.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a268dd2313647679487dca8125cb32a5d71a0ab5569c8faf5bfe2fac.script (certifyingInputs ctx) 1000)]
