import CardanoLedgerApi.V2
import LiveScripts.S_8e941c939dd9d78715db1d88c9b7f4b18d9af12b288e3f8f84314525.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8e941c939dd9d78715db1d88c9b7f4b18d9af12b288e3f8f84314525.script (spendingInputs input) 1000)]
