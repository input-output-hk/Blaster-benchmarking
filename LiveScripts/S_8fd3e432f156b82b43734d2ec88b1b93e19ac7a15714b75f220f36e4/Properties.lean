import CardanoLedgerApi.V2
import LiveScripts.S_8fd3e432f156b82b43734d2ec88b1b93e19ac7a15714b75f220f36e4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8fd3e432f156b82b43734d2ec88b1b93e19ac7a15714b75f220f36e4.script (spendingInputs input) 1000)]
