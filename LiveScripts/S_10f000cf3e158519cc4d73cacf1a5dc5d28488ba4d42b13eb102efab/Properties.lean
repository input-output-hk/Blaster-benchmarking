import CardanoLedgerApi.V3
import LiveScripts.S_10f000cf3e158519cc4d73cacf1a5dc5d28488ba4d42b13eb102efab.Script
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
      ¬ isSuccessful (cekExecuteProgram script_10f000cf3e158519cc4d73cacf1a5dc5d28488ba4d42b13eb102efab.script (spendingInputs ctx) 1000)]
