import CardanoLedgerApi.V1
import LiveScripts.S_f3a45ca155b3e62acc80d858ea56fedb7aa590c4ac811d6179035376.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f3a45ca155b3e62acc80d858ea56fedb7aa590c4ac811d6179035376.script (spendingInputs input) 1000)]
