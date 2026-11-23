import CardanoLedgerApi.V3
import LiveScripts.S_f43417328fe0ca853ed79bf88c65522e4a9bdc95062dcdf3650af78d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f43417328fe0ca853ed79bf88c65522e4a9bdc95062dcdf3650af78d.script (spendingInputs ctx) 1000)]
