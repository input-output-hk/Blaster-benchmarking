import CardanoLedgerApi.V3
import LiveScripts.S_9a81be8900f34a86e80c1a7f6345abe5bd86f60b4700a047e513a3b0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9a81be8900f34a86e80c1a7f6345abe5bd86f60b4700a047e513a3b0.script (spendingInputs ctx) 1000)]
