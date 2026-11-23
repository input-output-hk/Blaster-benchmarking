import CardanoLedgerApi.V3
import LiveScripts.S_eb5232a5f5743f8b4b57e6bc5949218af7aa6f7fb9a94e42543b7776.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eb5232a5f5743f8b4b57e6bc5949218af7aa6f7fb9a94e42543b7776.script (spendingInputs ctx) 1000)]
