import CardanoLedgerApi.V3
import LiveScripts.S_950be3650263b8233823f7684391293624c7ab8541dd0f5c5f3cf1ba.Script
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
      ¬ isSuccessful (cekExecuteProgram script_950be3650263b8233823f7684391293624c7ab8541dd0f5c5f3cf1ba.script (spendingInputs ctx) 1000)]
