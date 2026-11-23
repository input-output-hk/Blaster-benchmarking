import CardanoLedgerApi.V1
import LiveScripts.S_3752c1bb5e0b535e6ac0d369e7e57d21e95d4cf614a36a94ded781d4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3752c1bb5e0b535e6ac0d369e7e57d21e95d4cf614a36a94ded781d4.script (spendingInputs input) 1000)]
