import CardanoLedgerApi.V3
import LiveScripts.S_dd94113cc07cbe0f0c331c9ba10477795ca90bfb1e3e348b40d15a31.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dd94113cc07cbe0f0c331c9ba10477795ca90bfb1e3e348b40d15a31.script (spendingInputs ctx) 1000)]
