import CardanoLedgerApi.V2
import LiveScripts.S_490acbb3d0bb7067809960323079b6ad779c10aaa2e066e0898d1dcf.Script
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
      ¬ isSuccessful (cekExecuteProgram script_490acbb3d0bb7067809960323079b6ad779c10aaa2e066e0898d1dcf.script (spendingInputs input) 1000)]
