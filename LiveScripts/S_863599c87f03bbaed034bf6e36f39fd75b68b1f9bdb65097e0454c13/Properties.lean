import CardanoLedgerApi.V3
import LiveScripts.S_863599c87f03bbaed034bf6e36f39fd75b68b1f9bdb65097e0454c13.Script
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
      ¬ isSuccessful (cekExecuteProgram script_863599c87f03bbaed034bf6e36f39fd75b68b1f9bdb65097e0454c13.script (spendingInputs ctx) 1000)]
