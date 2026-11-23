import CardanoLedgerApi.V2
import LiveScripts.S_31070a43f38dc8edd236d1ec7562fb1b54b55d710f3d385a68ffdc46.Script
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
      ¬ isSuccessful (cekExecuteProgram script_31070a43f38dc8edd236d1ec7562fb1b54b55d710f3d385a68ffdc46.script (spendingInputs input) 1000)]
