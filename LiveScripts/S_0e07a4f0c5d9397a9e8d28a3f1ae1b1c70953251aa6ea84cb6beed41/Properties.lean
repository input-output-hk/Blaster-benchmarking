import CardanoLedgerApi.V3
import LiveScripts.S_0e07a4f0c5d9397a9e8d28a3f1ae1b1c70953251aa6ea84cb6beed41.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0e07a4f0c5d9397a9e8d28a3f1ae1b1c70953251aa6ea84cb6beed41.script (spendingInputs ctx) 1000)]
