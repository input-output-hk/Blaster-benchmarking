import CardanoLedgerApi.V3
import LiveScripts.S_6377762e9346f87ed0d690e9132116b5a0f73ab4dbe0c87329c1490f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6377762e9346f87ed0d690e9132116b5a0f73ab4dbe0c87329c1490f.script (spendingInputs ctx) 1000)]
