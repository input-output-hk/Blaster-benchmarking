import CardanoLedgerApi.V2
import LiveScripts.S_19b9908183fc7180d82cb5e15bf9434f4eb644019b63dfd4ae4dbb0b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_19b9908183fc7180d82cb5e15bf9434f4eb644019b63dfd4ae4dbb0b.script (spendingInputs input) 1000)]
