import CardanoLedgerApi.V3
import LiveScripts.S_26b49350b7ffd1f3a1d15d0e234603b29077dea9b392dd57d3e44115.Script
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
      ¬ isSuccessful (cekExecuteProgram script_26b49350b7ffd1f3a1d15d0e234603b29077dea9b392dd57d3e44115.script (spendingInputs ctx) 1000)]
