import CardanoLedgerApi.V3
import LiveScripts.S_cc6367eea6d8f212ac5b8b76f4148e7be54cc2d91472a6fffe8709d1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cc6367eea6d8f212ac5b8b76f4148e7be54cc2d91472a6fffe8709d1.script (spendingInputs ctx) 1000)]
