import CardanoLedgerApi.V3
import LiveScripts.S_7c55bea1e5109eab701c5accf2631fc2103453414d8efc2c78bcd219.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7c55bea1e5109eab701c5accf2631fc2103453414d8efc2c78bcd219.script (certifyingInputs ctx) 1000)]
