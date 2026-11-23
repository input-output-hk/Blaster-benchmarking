import CardanoLedgerApi.V1
import LiveScripts.S_9b85d5e8611945505f078aeededcbed1d6ca11053f61e3f9d999fe44.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9b85d5e8611945505f078aeededcbed1d6ca11053f61e3f9d999fe44.script (spendingInputs input) 1000)]
