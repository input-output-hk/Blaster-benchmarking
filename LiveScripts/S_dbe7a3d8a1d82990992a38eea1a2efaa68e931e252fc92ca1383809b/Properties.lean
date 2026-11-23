import CardanoLedgerApi.V2
import LiveScripts.S_dbe7a3d8a1d82990992a38eea1a2efaa68e931e252fc92ca1383809b.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_dbe7a3d8a1d82990992a38eea1a2efaa68e931e252fc92ca1383809b.script (spendingInputs input) 1000)]
