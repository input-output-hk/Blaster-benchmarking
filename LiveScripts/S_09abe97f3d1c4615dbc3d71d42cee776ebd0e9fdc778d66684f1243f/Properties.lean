import CardanoLedgerApi.V3
import LiveScripts.S_09abe97f3d1c4615dbc3d71d42cee776ebd0e9fdc778d66684f1243f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_09abe97f3d1c4615dbc3d71d42cee776ebd0e9fdc778d66684f1243f.script (spendingInputs ctx) 1000)]
