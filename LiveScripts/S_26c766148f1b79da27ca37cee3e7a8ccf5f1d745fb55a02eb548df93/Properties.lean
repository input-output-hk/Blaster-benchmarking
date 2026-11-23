import CardanoLedgerApi.V1
import LiveScripts.S_26c766148f1b79da27ca37cee3e7a8ccf5f1d745fb55a02eb548df93.Script
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
      ¬ isSuccessful (cekExecuteProgram script_26c766148f1b79da27ca37cee3e7a8ccf5f1d745fb55a02eb548df93.script (spendingInputs input) 1000)]
