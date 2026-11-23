import CardanoLedgerApi.V3
import LiveScripts.S_d8d54387e92f1f3e08e101daceb058e1f2b9a858acca899b9cc76bee.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d8d54387e92f1f3e08e101daceb058e1f2b9a858acca899b9cc76bee.script (spendingInputs ctx) 1000)]
