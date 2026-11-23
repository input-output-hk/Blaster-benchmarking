import CardanoLedgerApi.V3
import LiveScripts.S_5e40259d6bae4053e91bf2bbb21b5e5a1028ae60a712d39b59695a68.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5e40259d6bae4053e91bf2bbb21b5e5a1028ae60a712d39b59695a68.script (spendingInputs ctx) 1000)]
