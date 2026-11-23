import CardanoLedgerApi.V2
import LiveScripts.S_3eca957ef02d32f3ae24fe7a8a0b210522de7abe32282203eb32fe0a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3eca957ef02d32f3ae24fe7a8a0b210522de7abe32282203eb32fe0a.script (spendingInputs input) 1000)]
