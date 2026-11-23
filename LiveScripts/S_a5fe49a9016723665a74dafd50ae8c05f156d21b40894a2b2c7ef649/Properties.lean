import CardanoLedgerApi.V3
import LiveScripts.S_a5fe49a9016723665a74dafd50ae8c05f156d21b40894a2b2c7ef649.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a5fe49a9016723665a74dafd50ae8c05f156d21b40894a2b2c7ef649.script (spendingInputs ctx) 1000)]
