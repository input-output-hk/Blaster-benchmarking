import CardanoLedgerApi.V1
import LiveScripts.S_2f190e3f01e3b57d70b97006e38bddbe2f056187b3e8817b92970f32.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2f190e3f01e3b57d70b97006e38bddbe2f056187b3e8817b92970f32.script (spendingInputs input) 1000)]
