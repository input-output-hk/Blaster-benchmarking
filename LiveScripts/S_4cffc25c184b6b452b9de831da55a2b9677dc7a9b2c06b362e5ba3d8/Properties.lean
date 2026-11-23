import CardanoLedgerApi.V2
import LiveScripts.S_4cffc25c184b6b452b9de831da55a2b9677dc7a9b2c06b362e5ba3d8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4cffc25c184b6b452b9de831da55a2b9677dc7a9b2c06b362e5ba3d8.script (spendingInputs input) 1000)]
