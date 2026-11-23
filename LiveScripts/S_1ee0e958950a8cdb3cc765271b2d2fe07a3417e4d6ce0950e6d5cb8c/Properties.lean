import CardanoLedgerApi.V3
import LiveScripts.S_1ee0e958950a8cdb3cc765271b2d2fe07a3417e4d6ce0950e6d5cb8c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1ee0e958950a8cdb3cc765271b2d2fe07a3417e4d6ce0950e6d5cb8c.script (spendingInputs ctx) 1000)]
