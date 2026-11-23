import CardanoLedgerApi.V3
import LiveScripts.S_cbd1362aba2c786b2198a54a36ebd3d042c10fe65d3b5e5d55e48cd4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cbd1362aba2c786b2198a54a36ebd3d042c10fe65d3b5e5d55e48cd4.script (spendingInputs ctx) 1000)]
