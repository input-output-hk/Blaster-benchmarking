import CardanoLedgerApi.V3
import LiveScripts.S_c4ba161e77d689d2540465ed2c119ce83e7c1d2495e4dce3b3284c44.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c4ba161e77d689d2540465ed2c119ce83e7c1d2495e4dce3b3284c44.script (spendingInputs ctx) 1000)]
