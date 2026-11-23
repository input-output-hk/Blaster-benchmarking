import CardanoLedgerApi.V3
import LiveScripts.S_291f4cffc789ba9b4bbae373bd5286a92dc0e200e4f4cf3eb3fd57ee.Script
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
      ¬ isSuccessful (cekExecuteProgram script_291f4cffc789ba9b4bbae373bd5286a92dc0e200e4f4cf3eb3fd57ee.script (spendingInputs ctx) 1000)]
