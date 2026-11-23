import CardanoLedgerApi.V2
import LiveScripts.S_2628bcd5fb3b55c1661cf0b6bb9331a0bb59e31ce3c903b41ae45e75.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2628bcd5fb3b55c1661cf0b6bb9331a0bb59e31ce3c903b41ae45e75.script (spendingInputs input) 1000)]
