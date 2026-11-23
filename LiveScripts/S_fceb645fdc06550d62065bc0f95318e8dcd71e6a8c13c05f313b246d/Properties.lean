import CardanoLedgerApi.V2
import LiveScripts.S_fceb645fdc06550d62065bc0f95318e8dcd71e6a8c13c05f313b246d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fceb645fdc06550d62065bc0f95318e8dcd71e6a8c13c05f313b246d.script (spendingInputs input) 1000)]
