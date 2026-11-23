import CardanoLedgerApi.V1
import LiveScripts.S_7ae70b15af69ac5f452693f9dec0d7bf6ae33fc2ba978695ff73b214.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7ae70b15af69ac5f452693f9dec0d7bf6ae33fc2ba978695ff73b214.script (spendingInputs input) 1000)]
