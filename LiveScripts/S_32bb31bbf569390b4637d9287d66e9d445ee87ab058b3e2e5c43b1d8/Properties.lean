import CardanoLedgerApi.V3
import LiveScripts.S_32bb31bbf569390b4637d9287d66e9d445ee87ab058b3e2e5c43b1d8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_32bb31bbf569390b4637d9287d66e9d445ee87ab058b3e2e5c43b1d8.script (spendingInputs ctx) 1000)]
