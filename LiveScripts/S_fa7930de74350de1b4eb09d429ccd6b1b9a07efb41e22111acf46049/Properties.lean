import CardanoLedgerApi.V1
import LiveScripts.S_fa7930de74350de1b4eb09d429ccd6b1b9a07efb41e22111acf46049.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fa7930de74350de1b4eb09d429ccd6b1b9a07efb41e22111acf46049.script (spendingInputs input) 1000)]
