import CardanoLedgerApi.V1
import LiveScripts.S_4020e7fc2de75a0729c3cc3af715b34d98381e0cdbcfa99c950bc3ac.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4020e7fc2de75a0729c3cc3af715b34d98381e0cdbcfa99c950bc3ac.script (spendingInputs input) 1000)]
