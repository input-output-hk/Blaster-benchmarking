import CardanoLedgerApi.V3
import LiveScripts.S_2d09e21ad2bd24b93c74615029d21c25aebdb306a8b4ab0aa0c2f6da.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2d09e21ad2bd24b93c74615029d21c25aebdb306a8b4ab0aa0c2f6da.script (spendingInputs ctx) 1000)]
