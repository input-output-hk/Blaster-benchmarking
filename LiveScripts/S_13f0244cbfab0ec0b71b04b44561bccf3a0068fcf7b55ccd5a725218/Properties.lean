import CardanoLedgerApi.V2
import LiveScripts.S_13f0244cbfab0ec0b71b04b44561bccf3a0068fcf7b55ccd5a725218.Script
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
      ¬ isSuccessful (cekExecuteProgram script_13f0244cbfab0ec0b71b04b44561bccf3a0068fcf7b55ccd5a725218.script (spendingInputs input) 1000)]
