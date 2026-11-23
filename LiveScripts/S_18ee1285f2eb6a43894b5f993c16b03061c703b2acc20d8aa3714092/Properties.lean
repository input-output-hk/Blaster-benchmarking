import CardanoLedgerApi.V3
import LiveScripts.S_18ee1285f2eb6a43894b5f993c16b03061c703b2acc20d8aa3714092.Script
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
      ¬ isSuccessful (cekExecuteProgram script_18ee1285f2eb6a43894b5f993c16b03061c703b2acc20d8aa3714092.script (spendingInputs ctx) 1000)]
