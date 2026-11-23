import CardanoLedgerApi.V2
import LiveScripts.S_0616eee6c734989333f194b3ab92bfd4ae1a2d7b8299da1d1a2aa01d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0616eee6c734989333f194b3ab92bfd4ae1a2d7b8299da1d1a2aa01d.script (spendingInputs input) 1000)]
