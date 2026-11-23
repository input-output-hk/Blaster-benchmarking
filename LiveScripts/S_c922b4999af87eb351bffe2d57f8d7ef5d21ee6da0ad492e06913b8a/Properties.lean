import CardanoLedgerApi.V3
import LiveScripts.S_c922b4999af87eb351bffe2d57f8d7ef5d21ee6da0ad492e06913b8a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c922b4999af87eb351bffe2d57f8d7ef5d21ee6da0ad492e06913b8a.script (spendingInputs ctx) 1000)]
