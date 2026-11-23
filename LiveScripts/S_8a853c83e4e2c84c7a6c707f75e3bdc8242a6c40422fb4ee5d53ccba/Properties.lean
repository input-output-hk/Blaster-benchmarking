import CardanoLedgerApi.V2
import LiveScripts.S_8a853c83e4e2c84c7a6c707f75e3bdc8242a6c40422fb4ee5d53ccba.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8a853c83e4e2c84c7a6c707f75e3bdc8242a6c40422fb4ee5d53ccba.script (spendingInputs input) 1000)]
