import CardanoLedgerApi.V1
import LiveScripts.S_f8c2ea6de1d4243b16dc1362ad34c6bf93edec7a49d057107172b402.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f8c2ea6de1d4243b16dc1362ad34c6bf93edec7a49d057107172b402.script (spendingInputs input) 1000)]
