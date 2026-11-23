import CardanoLedgerApi.V2
import LiveScripts.S_b4b42df4cb70c7442c8bd0d25b1aa4e5f2efcadf4499961a36d532b5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b4b42df4cb70c7442c8bd0d25b1aa4e5f2efcadf4499961a36d532b5.script (spendingInputs input) 1000)]
