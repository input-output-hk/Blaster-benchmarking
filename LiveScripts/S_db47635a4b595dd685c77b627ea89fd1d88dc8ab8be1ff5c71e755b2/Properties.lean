import CardanoLedgerApi.V2
import LiveScripts.S_db47635a4b595dd685c77b627ea89fd1d88dc8ab8be1ff5c71e755b2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_db47635a4b595dd685c77b627ea89fd1d88dc8ab8be1ff5c71e755b2.script (spendingInputs input) 1000)]
