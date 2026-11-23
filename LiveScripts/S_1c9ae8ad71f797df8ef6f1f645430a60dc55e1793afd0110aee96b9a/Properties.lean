import CardanoLedgerApi.V1
import LiveScripts.S_1c9ae8ad71f797df8ef6f1f645430a60dc55e1793afd0110aee96b9a.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V1
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_1c9ae8ad71f797df8ef6f1f645430a60dc55e1793afd0110aee96b9a.script (spendingInputs input) 1000)]
