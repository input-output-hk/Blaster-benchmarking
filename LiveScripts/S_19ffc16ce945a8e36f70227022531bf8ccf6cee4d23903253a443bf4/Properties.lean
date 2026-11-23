import CardanoLedgerApi.V2
import LiveScripts.S_19ffc16ce945a8e36f70227022531bf8ccf6cee4d23903253a443bf4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_19ffc16ce945a8e36f70227022531bf8ccf6cee4d23903253a443bf4.script (spendingInputs input) 1000)]
