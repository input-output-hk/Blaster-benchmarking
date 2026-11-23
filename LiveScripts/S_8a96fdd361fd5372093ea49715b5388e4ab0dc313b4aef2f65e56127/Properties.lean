import CardanoLedgerApi.V3
import LiveScripts.S_8a96fdd361fd5372093ea49715b5388e4ab0dc313b4aef2f65e56127.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8a96fdd361fd5372093ea49715b5388e4ab0dc313b4aef2f65e56127.script (spendingInputs ctx) 1000)]
