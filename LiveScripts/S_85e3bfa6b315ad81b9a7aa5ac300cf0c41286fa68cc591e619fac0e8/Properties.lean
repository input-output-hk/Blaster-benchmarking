import CardanoLedgerApi.V3
import LiveScripts.S_85e3bfa6b315ad81b9a7aa5ac300cf0c41286fa68cc591e619fac0e8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_85e3bfa6b315ad81b9a7aa5ac300cf0c41286fa68cc591e619fac0e8.script (spendingInputs ctx) 1000)]
