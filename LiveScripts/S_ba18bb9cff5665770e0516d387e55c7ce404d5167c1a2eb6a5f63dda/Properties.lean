import CardanoLedgerApi.V3
import LiveScripts.S_ba18bb9cff5665770e0516d387e55c7ce404d5167c1a2eb6a5f63dda.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ba18bb9cff5665770e0516d387e55c7ce404d5167c1a2eb6a5f63dda.script (spendingInputs ctx) 1000)]
