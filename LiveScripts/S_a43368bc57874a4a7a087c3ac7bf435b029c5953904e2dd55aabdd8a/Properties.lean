import CardanoLedgerApi.V3
import LiveScripts.S_a43368bc57874a4a7a087c3ac7bf435b029c5953904e2dd55aabdd8a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a43368bc57874a4a7a087c3ac7bf435b029c5953904e2dd55aabdd8a.script (spendingInputs ctx) 1000)]
