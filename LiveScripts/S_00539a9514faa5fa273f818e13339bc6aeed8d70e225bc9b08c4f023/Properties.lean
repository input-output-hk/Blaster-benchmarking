import CardanoLedgerApi.V3
import LiveScripts.S_00539a9514faa5fa273f818e13339bc6aeed8d70e225bc9b08c4f023.Script
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
      ¬ isSuccessful (cekExecuteProgram script_00539a9514faa5fa273f818e13339bc6aeed8d70e225bc9b08c4f023.script (spendingInputs ctx) 1000)]
