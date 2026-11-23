import CardanoLedgerApi.V3
import LiveScripts.S_958f5d82242a0ff9ad920cb1712bee7710550d9de2cf9b8f93355dc3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_958f5d82242a0ff9ad920cb1712bee7710550d9de2cf9b8f93355dc3.script (spendingInputs ctx) 1000)]
