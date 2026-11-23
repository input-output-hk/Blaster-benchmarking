import CardanoLedgerApi.V3
import LiveScripts.S_882cbb37779b7f1f3dd2b7643662de1bfc180baf225ef820c3d8feae.Script
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
      ¬ isSuccessful (cekExecuteProgram script_882cbb37779b7f1f3dd2b7643662de1bfc180baf225ef820c3d8feae.script (spendingInputs ctx) 1000)]
