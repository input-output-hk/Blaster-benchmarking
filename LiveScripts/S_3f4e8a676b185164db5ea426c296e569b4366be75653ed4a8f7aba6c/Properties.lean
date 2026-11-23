import CardanoLedgerApi.V3
import LiveScripts.S_3f4e8a676b185164db5ea426c296e569b4366be75653ed4a8f7aba6c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3f4e8a676b185164db5ea426c296e569b4366be75653ed4a8f7aba6c.script (spendingInputs ctx) 1000)]
