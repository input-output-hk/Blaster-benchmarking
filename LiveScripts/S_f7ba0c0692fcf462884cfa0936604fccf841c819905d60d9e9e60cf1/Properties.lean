import CardanoLedgerApi.V1
import LiveScripts.S_f7ba0c0692fcf462884cfa0936604fccf841c819905d60d9e9e60cf1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f7ba0c0692fcf462884cfa0936604fccf841c819905d60d9e9e60cf1.script (spendingInputs input) 1000)]
