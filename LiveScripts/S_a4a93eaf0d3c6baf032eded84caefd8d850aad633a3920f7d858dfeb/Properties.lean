import CardanoLedgerApi.V2
import LiveScripts.S_a4a93eaf0d3c6baf032eded84caefd8d850aad633a3920f7d858dfeb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a4a93eaf0d3c6baf032eded84caefd8d850aad633a3920f7d858dfeb.script (spendingInputs input) 1000)]
