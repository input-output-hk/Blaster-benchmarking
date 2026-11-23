import CardanoLedgerApi.V3
import LiveScripts.S_5d90f454fa48293fbe77eef9b0a0a2901cb636d88b0e81651f4fdf0c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5d90f454fa48293fbe77eef9b0a0a2901cb636d88b0e81651f4fdf0c.script (spendingInputs ctx) 1000)]
