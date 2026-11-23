import CardanoLedgerApi.V1
import LiveScripts.S_0f71d4b9c196df1c5974e2ecbbc21dc1a49c9da71ff8bd7cda2d44fc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0f71d4b9c196df1c5974e2ecbbc21dc1a49c9da71ff8bd7cda2d44fc.script (spendingInputs input) 1000)]
