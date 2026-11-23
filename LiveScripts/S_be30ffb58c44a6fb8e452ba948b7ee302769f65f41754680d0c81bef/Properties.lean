import CardanoLedgerApi.V1
import LiveScripts.S_be30ffb58c44a6fb8e452ba948b7ee302769f65f41754680d0c81bef.Script
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
      ¬ isSuccessful (cekExecuteProgram script_be30ffb58c44a6fb8e452ba948b7ee302769f65f41754680d0c81bef.script (spendingInputs input) 1000)]
