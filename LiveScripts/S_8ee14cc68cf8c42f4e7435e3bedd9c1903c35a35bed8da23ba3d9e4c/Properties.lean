import CardanoLedgerApi.V1
import LiveScripts.S_8ee14cc68cf8c42f4e7435e3bedd9c1903c35a35bed8da23ba3d9e4c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8ee14cc68cf8c42f4e7435e3bedd9c1903c35a35bed8da23ba3d9e4c.script (spendingInputs input) 1000)]
