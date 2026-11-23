import CardanoLedgerApi.V1
import LiveScripts.S_5938fa5bb987fddb1e9c08fc7ed3155dfbb717d90fe60aca8b36e89d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5938fa5bb987fddb1e9c08fc7ed3155dfbb717d90fe60aca8b36e89d.script (spendingInputs input) 1000)]
