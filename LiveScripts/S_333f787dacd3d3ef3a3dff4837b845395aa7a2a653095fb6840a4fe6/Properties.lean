import CardanoLedgerApi.V3
import LiveScripts.S_333f787dacd3d3ef3a3dff4837b845395aa7a2a653095fb6840a4fe6.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validSpendingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_333f787dacd3d3ef3a3dff4837b845395aa7a2a653095fb6840a4fe6.script (spendingInputs ctx) 1000)]
