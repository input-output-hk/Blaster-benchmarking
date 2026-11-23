import CardanoLedgerApi.V3
import LiveScripts.S_16c65666bcbfdd5df00cf49a304169d80a313b36a7f2788aa4a653e4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_16c65666bcbfdd5df00cf49a304169d80a313b36a7f2788aa4a653e4.script (spendingInputs ctx) 1000)]
