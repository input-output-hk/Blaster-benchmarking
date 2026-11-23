import CardanoLedgerApi.V3
import LiveScripts.S_09426f3e02d260d6f44df2cdcea66f761f7074b5279e2e7e7e59e010.Script
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
      ¬ isSuccessful (cekExecuteProgram script_09426f3e02d260d6f44df2cdcea66f761f7074b5279e2e7e7e59e010.script (spendingInputs ctx) 1000)]
