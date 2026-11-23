import CardanoLedgerApi.V3
import LiveScripts.S_d150182ef4eb2b27d79cb881c463f4e384ec1749cc09c3d61d2078ed.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d150182ef4eb2b27d79cb881c463f4e384ec1749cc09c3d61d2078ed.script (spendingInputs ctx) 1000)]
