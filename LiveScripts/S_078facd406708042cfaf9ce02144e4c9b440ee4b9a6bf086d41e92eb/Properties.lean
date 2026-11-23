import CardanoLedgerApi.V2
import LiveScripts.S_078facd406708042cfaf9ce02144e4c9b440ee4b9a6bf086d41e92eb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_078facd406708042cfaf9ce02144e4c9b440ee4b9a6bf086d41e92eb.script (spendingInputs input) 1000)]
