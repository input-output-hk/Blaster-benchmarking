import CardanoLedgerApi.V3
import LiveScripts.S_20f9e1ffa2f6d090cae28aa96996d6bd4bf3ae47b02ef8a140a89734.Script
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
      ¬ isSuccessful (cekExecuteProgram script_20f9e1ffa2f6d090cae28aa96996d6bd4bf3ae47b02ef8a140a89734.script (spendingInputs ctx) 1000)]
