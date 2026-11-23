import CardanoLedgerApi.V3
import LiveScripts.S_14eabcf7743b6d322955af1e176d3a2df0e466f98f9dd798db3f7327.Script
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
      ¬ isSuccessful (cekExecuteProgram script_14eabcf7743b6d322955af1e176d3a2df0e466f98f9dd798db3f7327.script (certifyingInputs ctx) 1000)]
