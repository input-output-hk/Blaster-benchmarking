import CardanoLedgerApi.V3
import LiveScripts.S_6f1be9594f8df02bcb7f2faab22d548fb2784b3ea4b5e0a428fe5d09.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6f1be9594f8df02bcb7f2faab22d548fb2784b3ea4b5e0a428fe5d09.script (spendingInputs ctx) 1000)]
