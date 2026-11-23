import CardanoLedgerApi.V3
import LiveScripts.S_10b917d5712f0cef37c44ddbb7841011c8d9364ea7879ed891d16f03.Script
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
      ¬ isSuccessful (cekExecuteProgram script_10b917d5712f0cef37c44ddbb7841011c8d9364ea7879ed891d16f03.script (spendingInputs ctx) 1000)]
