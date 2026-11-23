import CardanoLedgerApi.V3
import LiveScripts.S_3b72baa75cff12b095ab7a90d6a123006070882d1fb9c4b34811e8ea.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3b72baa75cff12b095ab7a90d6a123006070882d1fb9c4b34811e8ea.script (spendingInputs ctx) 1000)]
