import CardanoLedgerApi.V3
import LiveScripts.S_cd7c107d3f8efc065109e4020cc1f03eb90445327917e2b0d7795c85.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cd7c107d3f8efc065109e4020cc1f03eb90445327917e2b0d7795c85.script (spendingInputs ctx) 1000)]
