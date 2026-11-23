import CardanoLedgerApi.V1
import LiveScripts.S_c4c81721d9c60f154b00abf1ef1b9b5a11e18203d136b95ca0c4f513.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c4c81721d9c60f154b00abf1ef1b9b5a11e18203d136b95ca0c4f513.script (spendingInputs input) 1000)]
