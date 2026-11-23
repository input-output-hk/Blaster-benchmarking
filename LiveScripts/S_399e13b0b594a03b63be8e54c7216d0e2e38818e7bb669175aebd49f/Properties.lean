import CardanoLedgerApi.V2
import LiveScripts.S_399e13b0b594a03b63be8e54c7216d0e2e38818e7bb669175aebd49f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_399e13b0b594a03b63be8e54c7216d0e2e38818e7bb669175aebd49f.script (spendingInputs input) 1000)]
