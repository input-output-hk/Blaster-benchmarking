import CardanoLedgerApi.V3
import LiveScripts.S_c515bfddb362fda03b4345416a48d5fc4ff66e02fd7b94ca0012c9a3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c515bfddb362fda03b4345416a48d5fc4ff66e02fd7b94ca0012c9a3.script (spendingInputs ctx) 1000)]
