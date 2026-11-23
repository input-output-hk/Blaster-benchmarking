import CardanoLedgerApi.V2
import LiveScripts.S_87f504b07add9e1d74ae102f53ab7f9ff2456dee897a43d8e27b348b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_87f504b07add9e1d74ae102f53ab7f9ff2456dee897a43d8e27b348b.script (spendingInputs input) 1000)]
