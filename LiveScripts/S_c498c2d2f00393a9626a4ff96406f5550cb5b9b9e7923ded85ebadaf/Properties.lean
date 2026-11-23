import CardanoLedgerApi.V3
import LiveScripts.S_c498c2d2f00393a9626a4ff96406f5550cb5b9b9e7923ded85ebadaf.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c498c2d2f00393a9626a4ff96406f5550cb5b9b9e7923ded85ebadaf.script (spendingInputs ctx) 1000)]
