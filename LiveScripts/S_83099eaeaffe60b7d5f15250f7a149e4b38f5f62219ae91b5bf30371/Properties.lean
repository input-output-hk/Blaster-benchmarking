import CardanoLedgerApi.V3
import LiveScripts.S_83099eaeaffe60b7d5f15250f7a149e4b38f5f62219ae91b5bf30371.Script
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
      ¬ isSuccessful (cekExecuteProgram script_83099eaeaffe60b7d5f15250f7a149e4b38f5f62219ae91b5bf30371.script (spendingInputs ctx) 1000)]
