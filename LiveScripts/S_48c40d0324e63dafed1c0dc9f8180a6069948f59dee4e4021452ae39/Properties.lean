import CardanoLedgerApi.V2
import LiveScripts.S_48c40d0324e63dafed1c0dc9f8180a6069948f59dee4e4021452ae39.Script
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
      ¬ isSuccessful (cekExecuteProgram script_48c40d0324e63dafed1c0dc9f8180a6069948f59dee4e4021452ae39.script (spendingInputs input) 1000)]
