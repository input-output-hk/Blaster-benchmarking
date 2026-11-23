import CardanoLedgerApi.V3
import LiveScripts.S_12a5d09c00831a7c86ba12e98e36350d81d8573c12143ff4f8e079ff.Script
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
      ¬ isSuccessful (cekExecuteProgram script_12a5d09c00831a7c86ba12e98e36350d81d8573c12143ff4f8e079ff.script (spendingInputs ctx) 1000)]
