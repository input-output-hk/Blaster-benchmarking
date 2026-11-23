import CardanoLedgerApi.V2
import LiveScripts.S_ba1ae41a8d08221d8249e5b9ea819ebe1547b244d098b679c5540b4f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ba1ae41a8d08221d8249e5b9ea819ebe1547b244d098b679c5540b4f.script (spendingInputs input) 1000)]
