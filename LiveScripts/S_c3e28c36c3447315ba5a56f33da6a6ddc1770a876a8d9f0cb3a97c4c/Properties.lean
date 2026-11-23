import CardanoLedgerApi.V2
import LiveScripts.S_c3e28c36c3447315ba5a56f33da6a6ddc1770a876a8d9f0cb3a97c4c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c3e28c36c3447315ba5a56f33da6a6ddc1770a876a8d9f0cb3a97c4c.script (spendingInputs input) 1000)]
