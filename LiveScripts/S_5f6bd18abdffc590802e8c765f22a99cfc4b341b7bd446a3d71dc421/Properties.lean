import CardanoLedgerApi.V3
import LiveScripts.S_5f6bd18abdffc590802e8c765f22a99cfc4b341b7bd446a3d71dc421.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5f6bd18abdffc590802e8c765f22a99cfc4b341b7bd446a3d71dc421.script (spendingInputs ctx) 1000)]
