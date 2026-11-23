import CardanoLedgerApi.V2
import LiveScripts.S_f60fd1e70f4b9dfc09cdde8d7f7f1277de2694c82a516d7d3cc9e03e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f60fd1e70f4b9dfc09cdde8d7f7f1277de2694c82a516d7d3cc9e03e.script (spendingInputs input) 1000)]
