import CardanoLedgerApi.V1
import LiveScripts.S_8b0f51b2d7715e3e045c64c8a224bc2cb3abb2be04c87845ac59f9c7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8b0f51b2d7715e3e045c64c8a224bc2cb3abb2be04c87845ac59f9c7.script (spendingInputs input) 1000)]
