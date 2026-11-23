import CardanoLedgerApi.V3
import LiveScripts.S_344ae66a2b1814716f084e73b8eecddd0d8d4e288ee2e738e9572e47.Script
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
      ¬ isSuccessful (cekExecuteProgram script_344ae66a2b1814716f084e73b8eecddd0d8d4e288ee2e738e9572e47.script (spendingInputs ctx) 1000)]
