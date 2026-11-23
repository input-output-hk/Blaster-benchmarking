import CardanoLedgerApi.V3
import LiveScripts.S_f3c8f243dfe639ff569172d8687204a6348f8dcb773a60d0e7e09a2d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f3c8f243dfe639ff569172d8687204a6348f8dcb773a60d0e7e09a2d.script (spendingInputs ctx) 1000)]
