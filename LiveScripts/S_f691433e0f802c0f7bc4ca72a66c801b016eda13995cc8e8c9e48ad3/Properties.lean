import CardanoLedgerApi.V3
import LiveScripts.S_f691433e0f802c0f7bc4ca72a66c801b016eda13995cc8e8c9e48ad3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f691433e0f802c0f7bc4ca72a66c801b016eda13995cc8e8c9e48ad3.script (spendingInputs ctx) 1000)]
