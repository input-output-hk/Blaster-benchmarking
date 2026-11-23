import CardanoLedgerApi.V3
import LiveScripts.S_2a7f2ed6d771f93e886a704de51bdb07594aa13c86eddffcb19e7492.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2a7f2ed6d771f93e886a704de51bdb07594aa13c86eddffcb19e7492.script (spendingInputs ctx) 1000)]
