import CardanoLedgerApi.V3
import LiveScripts.S_6f2fd3cc9cbcbf30e7f99a33cdbf32b169c7a02ac8c2c7b18112c6ec.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6f2fd3cc9cbcbf30e7f99a33cdbf32b169c7a02ac8c2c7b18112c6ec.script (spendingInputs ctx) 1000)]
