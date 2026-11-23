import CardanoLedgerApi.V3
import LiveScripts.S_aca4083ff40fe65cd938ad4bb3f0dced138dba21529b9eb216033c8d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_aca4083ff40fe65cd938ad4bb3f0dced138dba21529b9eb216033c8d.script (spendingInputs ctx) 1000)]
