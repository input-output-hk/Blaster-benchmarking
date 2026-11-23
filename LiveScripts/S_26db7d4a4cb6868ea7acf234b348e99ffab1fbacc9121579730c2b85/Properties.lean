import CardanoLedgerApi.V3
import LiveScripts.S_26db7d4a4cb6868ea7acf234b348e99ffab1fbacc9121579730c2b85.Script
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
      ¬ isSuccessful (cekExecuteProgram script_26db7d4a4cb6868ea7acf234b348e99ffab1fbacc9121579730c2b85.script (spendingInputs ctx) 1000)]
