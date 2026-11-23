import CardanoLedgerApi.V3
import LiveScripts.S_7e120f2fccef29721a8461fa22c5c7cbb2eebc93042518e8baaad3c9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7e120f2fccef29721a8461fa22c5c7cbb2eebc93042518e8baaad3c9.script (spendingInputs ctx) 1000)]
