import CardanoLedgerApi.V3
import LiveScripts.S_1b0dd8116b942d95fa8e506a118e2edc42e24b9d1b1cd78bd858e6fb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1b0dd8116b942d95fa8e506a118e2edc42e24b9d1b1cd78bd858e6fb.script (spendingInputs ctx) 1000)]
