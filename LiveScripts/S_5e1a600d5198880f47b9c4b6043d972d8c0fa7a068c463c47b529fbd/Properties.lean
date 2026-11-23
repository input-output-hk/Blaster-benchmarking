import CardanoLedgerApi.V3
import LiveScripts.S_5e1a600d5198880f47b9c4b6043d972d8c0fa7a068c463c47b529fbd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5e1a600d5198880f47b9c4b6043d972d8c0fa7a068c463c47b529fbd.script (spendingInputs ctx) 1000)]
